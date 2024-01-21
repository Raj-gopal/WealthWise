import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wealthwise/model/Intraday.dart';

class CandlestickGraph extends StatefulWidget {
  const CandlestickGraph({Key? key}) : super(key: key);

  @override
  _CandlestickGraphState createState() => _CandlestickGraphState();
}

class _CandlestickGraphState extends State<CandlestickGraph> {



  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream: channel.stream, 
    builder: (context,snapshot){


    });
    
  }
  }
