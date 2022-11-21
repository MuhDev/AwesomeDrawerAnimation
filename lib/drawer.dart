import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 3, 116, 207),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w300),
              ),
              const Text(
                "@dev_muh",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: Row(
                  children: const [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Favorites",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: Row(
                  children: const [
                    Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Map",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: Row(
                  children: const [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
