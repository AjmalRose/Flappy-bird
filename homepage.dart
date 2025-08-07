import 'dart:async';
import 'package:flutter/material.dart';
import 'bird.dart';
import 'barriers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameStarted = false;
  static double barrierXone = 1;
  double barrierXtwo = barrierXone + 2.0;

  void _showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: const Center(
            child: Text(
              "Game Over",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: resetGame,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  padding:  EdgeInsets.all(7),
                  color: Colors.white,
                  child: const Text(
                    "Play Again",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdYaxis = 0;
      gameStarted = false;
      time = 0;
      initialHeight = birdYaxis;
      barrierXone = 1;
      barrierXtwo = barrierXone + 2.0;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + (2.8 * time);
      setState(() {
        birdYaxis = initialHeight - height;

        // move barriers
        if (barrierXone < -1.1) {
          barrierXone += 4;
        } else {
          barrierXone -= 0.05;
        }

        if (barrierXtwo < -1.1) {
          barrierXtwo += 4;
        } else {
          barrierXtwo -= 0.05;
        }
      });

      if (birdIsDead()) {
        timer.cancel();
        gameStarted = false;
        _showDialogBox();
      }
    });
  }

  bool birdIsDead() {
    // hit the ground or top
    if (birdYaxis < -1 || birdYaxis > 1) {
      return true;
    }

    // collision logic with barrier to be added here
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    duration: const Duration(milliseconds: 0),
                    child: const MyBird(),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.3),
                    child: gameStarted
                        ? const Text("")
                        : const Text(
                            "Tap to Play",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                  ),
                  // Bottom Barrier One
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barrierXone, 1),
                    child: const Barrier(size: 150.0),
                  ),
                  // Top Barrier One
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barrierXone, -1),
                    child: const Barrier(size: 120.0),
                  ),
                  // Bottom Barrier Two
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barrierXtwo, 1.1),
                    child: const Barrier(size: 120.0),
                  ),
                  // Top Barrier Two
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barrierXtwo, -1.1),
                    child: const Barrier(size: 230.0),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green,
              height: 15,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Score
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Score",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(height: 20.0),
                        Text("0",
                            style:
                                TextStyle(color: Colors.white, fontSize: 35)),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    // Best
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Best",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(height: 20.0),
                        Text("0",
                            style:
                                TextStyle(color: Colors.white, fontSize: 35)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
