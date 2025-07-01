import 'package:flutter/material.dart';
import 'package:flutter_navigator/widgets/my_drawer.dart';

class ContactsPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      "name": "Youssef El Amrani",
      "phone": "+212 600 123 456",
      "email": "youssef.elamrani@gmail.com",
      "city": "Casablanca"
    },
    {
      "name": "Fatima Zahra Bouziane",
      "phone": "+212 610 987 654",
      "email": "fatima.bouziane@gmail.com",
      "city": "Rabat"
    },
    {
      "name": "Mohamed El Idrissi",
      "phone": "+212 650 789 123",
      "email": "mohamed.elidrissi@gmail.com",
      "city": "Marrakech"
    },
    {
      "name": "Khadija Ait Ali",
      "phone": "+212 680 234 567",
      "email": "khadija.aitali@gmail.com",
      "city": "Fes"
    },
    {
      "name": "Ahmed Bensalem",
      "phone": "+212 690 345 678",
      "email": "ahmed.bensalem@gmail.com",
      "city": "Tangier"
    },
    {
      "name": "Sanaa Benjelloun",
      "phone": "+212 670 456 789",
      "email": "sanaa.benjelloun@gmail.com",
      "city": "Agadir"
    },
    {
      "name": "Rachid El Fassi",
      "phone": "+212 660 567 890",
      "email": "rachid.elfassi@gmail.com",
      "city": "Meknes"
    },
    {
      "name": "Nadia El Khadir",
      "phone": "+212 650 678 901",
      "email": "nadia.elkhadir@gmail.com",
      "city": "Oujda"
    },
    {
      "name": "Youssef Amrani",
      "phone": "+212 640 789 012",
      "email": "you.amrani@gmail.com",
      "city": "Tetouan"
    },
    {
      "name": "Laila Ziani",
      "phone": "+212 630 890 123",
      "email": "laila.ziani@gmail.com",
      "city": "Nador"
    },
    {
      "name": "Hassan Bouazza",
      "phone": "+212 620 901 234",
      "email": "hassan.bouazza@gmail.com",
      "city": "Khouribga"
    },
    {
      "name": "Imane El Haddad",
      "phone": "+212 610 012 345",
      "email": "imane.elhaddad@gmail.com",
      "city": "Safi"
    },
    {
      "name": "Karim Fassi",
      "phone": "+212 600 123 789",
      "email": "karim.fassi@gmail.com",
      "city": "El Jadida"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Contacts")),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (_, __) => Divider(color: Colors.blueAccent),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Icon(Icons.person, color: Colors.blueAccent),
            title: Text(
              contact["name"]!,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(contact["city"]!),
            onTap: () {
              // Navigate to detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailsPage(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Contact details screen
class ContactDetailsPage extends StatelessWidget {
  final Map<String, String> contact;

  ContactDetailsPage({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact["name"]!),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.person, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              contact["name"]!,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 10),
            Text(
              "City: ${contact["city"]}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Phone: ${contact["phone"]}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Email: ${contact["email"]}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
