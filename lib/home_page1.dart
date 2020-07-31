import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tietactoe/custom_dialog.dart';
import 'package:tietactoe/game_button.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  List<GameButton> buttonlist;
  var player1;
  var player2;
  var activeplayer;

  @override
  void initState() {
    super.initState();
    buttonlist = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activeplayer = 1;
    var gamebt = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gamebt;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = "X";
        gb.bg = Colors.redAccent;
        activeplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.teal;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;

      int winner = checkWinner();
      if (winner == -1) {
        if (buttonlist.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog(
                  "Game Tied", "Press Restart button to start again"));
        }
      }
    });
  }

  int checkWinner() {
    int winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }

    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => new CustomDialog(
                "Player 1 Won", "Press Restart button to start again"));
      } else {
        showDialog(
            context: context,
            builder: (_) => new CustomDialog(
                "Player 2 Won", "Press Restart button to start again"));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonlist = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Expanded(
                child: new GridView.builder(
                    padding: new EdgeInsets.all(10.0),
                    itemCount: buttonlist.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 9.0,
                        mainAxisSpacing: 9.0),
                    itemBuilder: (context, i) => new SizedBox(
                          width: 100,
                          height: 100,
                          child: new RaisedButton(
                            padding: new EdgeInsets.all(8.0),
                            onPressed: buttonlist[i].enabled
                                ? () => playGame(buttonlist[i])
                                : null,
                            child: new Text(
                              buttonlist[i].text,
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 50.0),
                            ),
                            color: buttonlist[i].bg,
                            disabledColor: buttonlist[i].bg,
                          ),
                        )),
              ),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        splashColor: Colors.pink,
                        color: Colors.green,
                        focusColor: Colors.red,
                        child: new Text(
                          'Restart',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        onPressed: resetGame),
                  ]),
              new Padding(padding: const EdgeInsets.only(bottom: 25.0))
            ]));
  }
}
