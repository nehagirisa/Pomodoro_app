// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:microbiome_superhero_app/pomodoro/Ui/widget/circulartimerindicator.dart';
// import 'package:microbiome_superhero_app/utils/colors.dart';
// import 'package:google_fonts/google_fonts.dart';

// class PomodoroScreen extends StatefulWidget {
//   @override
//   _PomodoroScreenState createState() => _PomodoroScreenState();
// }

// class _PomodoroScreenState extends State<PomodoroScreen> {
//   int focusTime = 25 * 60; // 25 minutes in seconds
//   int breakTime = 5 * 60; // 5 minutes in seconds
//   int currentTime = 25 * 60; // Initial focus time
//   bool isRunning = false;
//   Timer? _timer;

//   void startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (currentTime > 0) {
//           currentTime--;
//         } else {
//           // Switch between focus and break time
//           if (currentTime == 0) {
//             if (focusTime == currentTime) {
//               currentTime = breakTime;
//             } else {
//               currentTime = focusTime;
//             }
//           }
//         }
//       });
//     });
//   }

//   void pauseTimer() {
//     _timer?.cancel();
//   }
//    void toggleTimer() {
//     if (isRunning) {
//       _timer!.cancel();
//     } else {
//       startTimer();
//     }
//     setState(() {
//       isRunning = !isRunning;
//     });
//   }

//   void resetTimer() {
//     pauseTimer();
//     setState(() {
//       currentTime = focusTime;
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String minutes = (currentTime ~/ 60).toString().padLeft(2, '0');
//     String seconds = (currentTime % 60).toString().padLeft(2, '0');

//     return Scaffold(
//       backgroundColor: myRed,
//       appBar: AppBar(
//         backgroundColor: myRed,
//         elevation: 0,
//          title: Text("Pomodoro App",
//              style: GoogleFonts.chicle(
//                textStyle: const TextStyle(
//                    color: Colors.white,
//                    fontWeight: FontWeight.normal,
//                    fontSize: 30,
//                    letterSpacing: 1.0),
//              )),
//         actions: [
//          IconButton(onPressed: resetTimer, 
//          icon:const Icon(Icons.restart_alt_outlined),),
//         ],
//       ),
//       body: Center(
//         child: Column(
          
//           children: <Widget>[
//              SizedBox(height: 30),
//             Text(
//               'Focus Time: ${focusTime ~/ 60} minutes',
//               style: TextStyle(fontSize: 18,color:background ),
//             ),
//             Text(
//               'Break Time: ${breakTime ~/ 60} minutes',
//               style: TextStyle(fontSize: 18,color: background),
//             ),
//             SizedBox(height: 30),
//             Text(
//               '$minutes:$seconds',
//               style: TextStyle(fontSize: 50,color: background),
//             ),
//            const SizedBox(height: 40,),
//              CircularTimerButton(
//               onPressed: toggleTimer,
//               isRunning: isRunning,
//               currentTime: currentTime,
//               focusTime: focusTime,
//             ),
//           ],
//         ),
//       ),
     
       
    
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pomodoroapp/timeservice.dart';
import 'package:pomodoroapp/widget/progress.dart';
import 'package:pomodoroapp/widget/timecontroller.dart';
import 'package:pomodoroapp/widget/timercard.dart';
import 'package:pomodoroapp/widget/timeroptions.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class pomodoroScreen extends StatelessWidget {
  const pomodoroScreen({super.key});
  Color renderColor(String currentState) {
    if (currentState == "FOCUS") {
      return Colors.redAccent;
    } else {
      return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: const Text(
          'POMOTIMER',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            iconSize: 40,
            color: Colors.white,
            onPressed: () =>
                Provider.of<timerservice>(context, listen: false).reset(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const TimerCard(),
              const SizedBox(
                height: 40,
              ),
              timerOptions(),
              const SizedBox(
                height: 80,
              ),
            
              const timeController()
            ],
          ),
        ),
      ),
    );
  }
}

