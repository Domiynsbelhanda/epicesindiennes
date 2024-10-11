import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../composants/epicesUse.dart';
import '../global.dart';

class RecipeDetail extends StatefulWidget {
  final int id;

  const RecipeDetail({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _RecipeDetail();
  }
}

class _RecipeDetail extends State<RecipeDetail> {
  late Recipe recipe;
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double _volume = 1.0; // Valeur de volume par défaut (1.0 = maximum)

  @override
  void initState() {
    super.initState();
    recipe = recipes.firstWhere((e) => e.id == widget.id);
    _controller = VideoPlayerController.asset(recipe.link)
      ..initialize().then((_) {
        // S'assurer que la vidéo est initialisée avant de reconstruire
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playVideo() {
    setState(() {
      _isPlaying = true; // Met à jour l'état pour afficher la vidéo
    });
    _controller.setVolume(_volume); // Définit le volume initial
    _controller.play(); // Joue la vidéo
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause(); // Met la vidéo en pause
      } else {
        _controller.play(); // Joue la vidéo
      }
      _isPlaying = !_isPlaying; // Change l'état de lecture
    });
  }

  void _resetVideo() {
    _controller.seekTo(Duration.zero); // Réinitialise la vidéo au début
    _playVideo(); // Joue la vidéo après réinitialisation
  }

  void _toggleFullScreen() {
    // Vous pouvez gérer le passage en plein écran ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: CurvedClipper(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailAppBar('Detail ${recipe.name}', context),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    width: width(context) / 1.2,
                    height: width(context) / 1.6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: _isPlaying
                            ? Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: VideoPlayer(_controller), // Affiche la vidéo
                            ),
                            VideoProgressIndicator(
                              _controller,
                              colors: const VideoProgressColors(
                                playedColor: Colors.red,
                                bufferedColor: Colors.grey,
                                backgroundColor: Colors.black26,
                              ),
                              allowScrubbing: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                                  onPressed: _togglePlayPause, // Alterne entre play et pause
                                ),
                                Expanded(
                                  child: Slider(
                                    value: _volume,
                                    onChanged: (value) {
                                      setState(() {
                                        _volume = value;
                                        _controller.setVolume(_volume); // Met à jour le volume
                                      });
                                    },
                                    min: 0.0,
                                    max: 1.0,
                                    activeColor: Colors.red,
                                    inactiveColor: Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.fullscreen),
                                  onPressed: _toggleFullScreen, // Gère le plein écran
                                ),
                                IconButton(
                                  icon: const Icon(Icons.replay),
                                  onPressed: _resetVideo, // Réinitialise la vidéo
                                ),
                              ],
                            ),
                          ],
                        )
                            : Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              recipe.image,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.play_arrow,
                                size: 64,
                                color: Colors.white,
                              ),
                              onPressed: _playVideo, // Joue la vidéo
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(top: 24.0, left: 32.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF263238),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Text(
                  recipe.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(top: 8.0, left: 32.0),
                child: Text(
                  recipe.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
