<<<<<<< HEAD
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('About AirPaste'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                    width: 250,
                    image: AssetImage(
                      'assets/icon.png',
                    )),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'About AirPaste\n',
                style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'AirPaste helps you to transfer text between your devices. The application makes it quick and easy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(
                  onPressed: () {
                    if (isVisible == false) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                    }
                  },
                  child: Text('Show license',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF121212),
                          fontWeight: FontWeight.normal))),
              SizedBox(
                height: 64,
              ),
              Center(
                child: Visibility(
                    visible: isVisible,
                    child: Text(
                      '''
MIT License
        
Copyright (c) 2022 Szélig Balázs
        
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
        
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
        
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
      \n\n
AirPaste is a submission for Coolest Projects Global (2022)
\n
      ''',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('About AirPaste'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                    width: 250,
                    image: AssetImage(
                      'assets/icon.png',
                    )),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'About AirPaste\n',
                style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'AirPaste helps you to transfer text between your devices. The application makes it quick and easy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(
                  onPressed: () {
                    if (isVisible == false) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                    }
                  },
                  child: Text('Show license',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF121212),
                          fontWeight: FontWeight.normal))),
              SizedBox(
                height: 64,
              ),
              Center(
                child: Visibility(
                    visible: isVisible,
                    child: Text(
                      '''
MIT License
        
Copyright (c) 2022 Szélig Balázs
        
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
        
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
        
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
      \n
\n
      ''',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> 5ced99a (Update)
