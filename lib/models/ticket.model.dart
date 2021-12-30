class Ticket {
  int tokens;
  int amount;
  String type;
  //String imageUrl;

  Ticket({
    required this.tokens,
    required this.amount,
    required this.type,
    //required this.imageUrl,
  });
}

List<Ticket> tickets = [
  Ticket(
    tokens: 200,
    amount: 1,
    type: "Train",
  ),
  Ticket(
    tokens: 100,
    amount: 1,
    type: "Bus",
  ),
  Ticket(
    tokens: 150,
    amount: 1,
    type: "Metro",
  ),
  Ticket(
    tokens: 200,
    amount: 1,
    type: "Train",
  ),

];