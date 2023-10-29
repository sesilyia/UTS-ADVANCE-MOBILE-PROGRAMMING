import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 70, 70, 70),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, // Warna bawah
              const Color.fromARGB(255, 70, 70, 70), // Warna atas
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _icon(),
              const SizedBox(),
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 20),
              ),
              DashboardIconsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 70, 70, 70),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/me.jpg'),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Sesilyia Khalifatun",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: const Color.fromARGB(255, 70, 70, 70)),
                )),
            const Text(
              "21670065",
              style: TextStyle(
                  fontSize: 18, color: const Color.fromARGB(255, 70, 70, 70)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DashboardIconsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: <Widget>[
        DashboardIcon(
          icon: Icons.person,
          label: "Profile",
          iconColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        DashboardIcon(
          icon: Icons.location_on,
          label: "Address",
          iconColor: Colors.white,
        ),
        DashboardIcon(
          icon: Icons.phone_android,
          label: "Phone",
          iconColor: Colors.white,
        ),
        DashboardIcon(
          icon: Icons.email,
          label: "Email",
          iconColor: Colors.white,
        ),
        DashboardIcon(
          icon: Icons.camera_alt,
          label: "Camera",
          iconColor: Colors.white,
        ),
        DashboardIcon(
          icon: Icons.settings,
          label: "Setting",
          iconColor: Colors.white,
        ),
      ],
    );
  }
}

class DashboardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color iconColor;

  DashboardIcon({
    required this.icon,
    required this.label,
    this.onPressed = _dummyOnPressed,
    this.iconColor = const Color.fromARGB(255, 67, 73, 78),
  });

  static void _dummyOnPressed() {
    print("Tombol belum dikonfigurasi.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 70, 70, 70),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: iconColor,
            ),
            iconSize: 50,
            onPressed: onPressed,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}

Widget _icon() {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 70, 70, 70), width: 2),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.person,
            color: Color.fromARGB(255, 70, 70, 70), size: 50),
      ),
    ],
  );
}
