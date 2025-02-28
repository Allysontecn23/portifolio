import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allyson Torres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 12, 70),
        title: const Text('Allyson Torres', 
        style: TextStyle(
          color: Colors.white
        ),
      ),
      ),
      body: Container(
        height: deviceHeight,
        color: const Color.fromRGBO(10, 10, 22, 1),
        child: Row(
          children: [
            Container(
              width: deviceWidth *0.5,
              padding: EdgeInsets.only(left: deviceWidth * 0.1),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Seção de Apresentação
                      const Text(
                        'Olá, eu sou um dev mobile e web',
                        style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Olá! Sou Allyson Torres, um apaixonado por desenvolvimento web e mobile e criador de soluções inovadoras que ajudam a transformar ideias em realidade.\n Meu trabalho é movido pela busca constante de aprendizado, inovação e excelência. Acredito que a chave para um projeto bem-sucedido está na colaboração e comunicação eficaz, tanto com a equipe quanto com o cliente, garantindo que cada detalhe seja atendido com atenção e dedicação.\n Neste portfólio, você encontrará alguns dos meus projetos, que representam a diversidade e a qualidade do meu trabalho. Cada projeto foi uma oportunidade de aprender e crescer, e espero que você se inspire com o que compartilhei aqui.",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      
                      // Seção de Projetos
                      const Text(
                        'Meus Projetos',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProjectCard(
                        title: 'Organograma',
                        description: 'Organograma da equipe de jiu-jitsu.',
                        link: 'https://organo-delta-mocha.vercel.app/',
                      ),
                      ProjectCard(
                        title: 'Frella Ann',
                        description: 'Site de frella para sites.',
                        link: 'https://master.d2t3665vd2u0cf.amplifyapp.com/',
                      ),
                      ProjectCard(
                        title: 'Loja',
                        description: 'Loja de joias naturais.',
                        link: 'https://gratis6398.wordpress.com',
                      ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      
                      // Seção de Contato
                      const Text(
                        'Contato',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text('Email: allysonnamikase@gmail.com', style: TextStyle(color: Colors.blueGrey),),
                      const Text('LinkedIn: linkedin.com/in/seunome', style: TextStyle(color: Colors.blueGrey),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight *0.5,
              width: deviceWidth *0.5,
              child: Image.network('https://blog.clickio.com/wp-content/uploads/2022/04/mobile-app-web-app-and-progressive-web-app_-whats-the-difference_-2.png'),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  ProjectCard({required this.title, required this.description, required this.link});
  
    Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);  
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(  
      margin: const EdgeInsets.only(left: 18, top: 8, bottom: 8),  
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                 _launchURL(link);
              },
              child: const Text(
                'Acesse o link!',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
