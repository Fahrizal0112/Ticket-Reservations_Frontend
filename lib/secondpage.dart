import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int heroTag;

  const SecondPage({super.key, required this.heroTag});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime _selectedDate = DateTime.now();
  List<bool> _seats = List.generate(10, (index) => false);
  int _selectedSeatsCount = 0;
  static const int _seatPrice = 50000;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _onSeatSelected(int index) {
    setState(() {
      _seats[index] = !_seats[index];
      _selectedSeatsCount = _seats.where((selected) => selected).length;
    });
  }

  void _onOrderPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:  Text("Pesanan berhasil diproses. Selamat menonton!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = _movies[widget.heroTag];
    final totalPrice = _selectedSeatsCount * _seatPrice;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Movie")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: widget.heroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(movie['imageUrl']!),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              movie['title']!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Text("Rp 50.000"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date: ${_selectedDate.toLocal().toShortDateString()}'),
            ),
            const SizedBox(height: 16.0),
            const Text('Select Seats:'),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _seats.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onSeatSelected(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _seats[index] ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Seat ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Text(
              'Total: Rp ${totalPrice.toString()}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectedSeatsCount > 0 ? _onOrderPressed : null,
              child: const Text('Pesan'),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> _movies = [
  {
    'imageUrl': 'https://m.media-amazon.com/images/M/MV5BNzRiMjg0MzUtNTQ1Mi00Y2Q5LWEwM2MtMzUwZDU5NmVjN2NkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'title': 'DeadPool And Wolverine',
  },
  {
    'imageUrl': 'https://m.media-amazon.com/images/M/MV5BODA5MTY0OWUtNjdlOC00NDI5LWE3NjYtNDM4MDI2MzE4OWUxXkEyXkFqcGdeQXVyOTAzODkzMjI@._V1_FMjpg_UX1000_.jpg',
    'title': 'Spiderman Far From Home',
  },
  {
    'imageUrl': 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_FMjpg_UX1000_.jpg',
    'title': 'Avengers Infinity Wars',
  },
];

extension DateFormat on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}