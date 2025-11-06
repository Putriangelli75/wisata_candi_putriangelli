import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  //TODO: 5. Implementasi fungsi signin
  void signIn(){
    setState(() {
      isSignedIn = isSignedIn;
    });
  }
  //TODO: 6. Implementassi fungsi signout
  void signOut(){
    setState(() {
      isSignedIn = isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.deepPurple,
          ), //Container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //TODO: 2. Buat bagian ProfilHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ), //BoxDecoration
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'images/placeholder_image.png'),
                          ), //CircleAvatar
                        ), //Container
                        if(isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt,
                              color: Colors.deepPurple[50],),), //IconButton
                      ],
                    ), //Stack
                  ), //Padding
                ),
                //Align
                // TODO: 3. Buat bagian ProfileInfo yang berisi info profil
                SizedBox(height: 20),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                    //Tindakan saat ikon edit ditekan, misalnya: pengeditan nama
                    debugPrint('Icon edit ditekan ...');
                  },
                  iconColor: Colors.blue,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                  iconColor: Colors.red,
                ),

                // TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 20),
                isSignedIn ? TextButton(
                    onPressed: signOut,
                    child: Text('Sign Out')) //TextButton
                    : TextButton(
                    onPressed: signIn,
                    child: Text('Sign In')), //TextButton
              ],
            ), //Column
          ), //Padding
        ],
      ), //Stack
    ); //Scaffold
  }
}
