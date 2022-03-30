import 'package:flutter/material.dart';
import 'package:imc/HomePage.dart';

class QuestionPage extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  const QuestionPage({ Key? key, required this.backgroundColor,  required this.textColor }) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context, const HomePage());
        }, icon:Icon(Icons.arrow_back, color: widget.textColor,)),
        backgroundColor: widget.backgroundColor,
        title: Text("Dúvidas", style: TextStyle(color: widget.textColor),),
        centerTitle: true,
        shadowColor: widget.textColor,
      ),

      backgroundColor: widget.backgroundColor,

      body: ListView(
        children: [
          Divider(),
          ListTile(
            title: Text("Para que serve o IMC?", style: TextStyle(color:  widget.textColor, fontSize: 24),),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Criado no século 19 pelo matemático Lambert Quételet, o Índice de Massa Corporal, conhecido pela sigla IMC, é um cálculo simples que permite medir se alguém está ou não com o peso ideal. Ele aponta se o peso está adequado ou se está abaixo ou acima do peso.", style: TextStyle(fontSize: 20, color: widget.textColor.withOpacity(0.75)),),
            ),
          ),

          Divider(),

          ListTile(title: Text("Como calcular?", style: TextStyle(color:  widget.textColor, fontSize: 24),),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Esta fórmula é bastante simples: divida o seu peso (Quilos) pela sua altura (Metros) ao quadrado (o número multiplicado por ele mesmo). IMC = Peso ÷ Altura²", style: TextStyle(fontSize: 20, color: widget.textColor.withOpacity(0.75)),),
          ),
          ),

          Divider(),

          ListTile(title: Text("Meu IMC está fora do ideal, o que fazer?", style: TextStyle(color:  widget.textColor, fontSize: 24),),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Qualquer que seja o resultado, não se preocupe. A primeira coisa a se fazer é procurar um especialista de sua confiança. Pode ser um cardiologista, endocrinologista, nutrólogo, nutricionista, enfim, busque auxílio profissional e não acredite em milagres. A obesidade é uma doença que se combate todos os dias, dia após dia.", style: TextStyle(fontSize: 20, color: widget.textColor.withOpacity(0.75)),),
          ),
          ),

          Divider(),

          ListTile(title: Text("Limitações do IMC", style: TextStyle(color:  widget.textColor, fontSize: 24),),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Há alguns problemas em usar o IMC para determinar se uma pessoa está acima do peso. Por exemplo, pessoas musculosas podem ter um Índice de Massa Corporal alto e não serem gordas. O IMC também não é aplicável para crianças, sendo que precisa de gráficos específicos. Além disso, não é aplicável para idosos, para os quais se aplica classificação diferenciada.", style: TextStyle(fontSize: 20, color: widget.textColor.withOpacity(0.75)),),
          ),
          ),

          Divider(),

          Column(
            children: [
              Text("App feito por:", style: TextStyle(color:  widget.textColor, fontSize: 26),),
              Text("Pedro do Couto Filgueiras", style: TextStyle(color:  widget.textColor, fontSize: 22)),
            ],
          )
        ],
      ),
      
    );
  }
}