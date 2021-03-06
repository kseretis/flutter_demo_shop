import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../packages.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;
  const OrderItemWidget(this.order);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: _expanded ? widget.order.products.length * 20.0 + 130 : 115,
      // curve: Curves.easeInOut,
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: Text('${widget.order.amount} \$'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy, HH:mm').format(widget.order.dateTime),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: _expanded
                  ? min(widget.order.products.length * 20.0 + 10, 180)
                  : 0,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.order.products[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.order.products[index].quantity} x ${widget.order.products[index].price} \$',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  );
                },
                itemCount: widget.order.products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
