# UniversoPrematuro_v7.2

Projeto Universo Prematuro - por LabLEPS
# Parceiros
    Universidade de Lisboa – Faculdade de Motricidade Humana,
    Laboratórios do PPG Promoção da Saúde.
    Apoio
    Universidade de Franca, FAPESP, CAPES
    Daniel Penã – tradução para o Espanhol.
# Patrocinadores
    CHB Sistemas
    ACIF de Franca
# Equipe
Responsável:
    Marisa Afonso Andrade Brunherotti
Equipe Pesquisa:
    Adriana Pernamburo Montesati
    Maysa Venturoso Gongora Buckeridge Serra
Equipe Tecnologia
    Rachel Afonso Andrade Brunherotti
    Gabriel Neves de Freitas Almeida 
    Marina Bernardes de Faria



## Getting Started

Aqui começa a documentação do Projeto Universo Prematuro v2.

- Começarei explicando as dependências, como instalar, atualizar e adicionar novos pacotes.
Também irei disponibilizar uma breve descrição sobre como funciona cada dependência.

# IMPORTANTE
- SEMPRE MANTER O AMBIENTE DE DESENVOLVIMENTO ("environment") ACIMA DO 2.12 PARA NÃO TER ERROS COM O NULL-SAFETY

## Dependências

version: 1.0.0+1

environment:
  sdk: ">=2.16.2 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  

  bloc_pattern: "^3.0.0+1"<br>
  carousel_slider: "^4.0.0""<br>
  connectivity_plus: "^2.3.0""<br>
  cupertino_icons: "^1.0.4""<br>
  chewie: "^1.3.1""<br>
  charts_flutter: "^0.12.0""<br>
  dropdownfield2: "^1.0.6""<br>
  dropdown_formfield: "^0.1.4""<br>
  font_awesome_flutter: "^10.1.0""<br>
  flutter_form_builder: "^7.1.1""<br>
  flutter_launcher_icons: "^0.9.2""<br>
  firebase_messaging: "^11.2.12""<br>
  firebase_core: "^1.3.0""<br>
  firebase_auth: "^2.0.0""<br>
  image_picker: "^0.8.5""<br>
  image: "^3.1.3""<br>
  location: "^4.3.0""<br>
  rxdart: "^0.27.3""<br>
  mask_text_input_formatter: "^2.3.0""<br>
  provider: "^6.0.2""<br>
  path_provider: "^2.0.9""<br>
  sqflite: "^2.0.2""<br>
  shimmer: "^2.0.0""<br>
  thumbnailer: "^2.0.1""<br>
  url_launcher: "^6.0.20""<br>
  video_player: "^2.3.0""<br>
  transparent_image: "^2.0.0""<br>
  zoom_widget: "^0.2.1""<br>

# Bloc_pattern:
- BLoC significa Componentes de lógica de negócios. A essência do BLoC é que tudo no aplicativo deve ser representado como fluxo de eventos: widgets submetem eventos; outros widgets responderão. 
BLoC fica no meio, gerenciando a conversa. Ele será criado separadamente da view, isolando a lógica do código.

Link: https://pub.dev/packages/bloc_pattern

# Carousel_Slider:
- Carousel_slider é um widget que possui as seguintes features:
    - Infinite Scroll
    - Custom Child Widgets
    - Auto Play

Link: https://pub.dev/packages/carousel_slider

# Connectivity_plus: 
- Este plugin permite que os aplicativos Flutter descubram a conectividade de rede e se configurem de acordo. Ele pode distinguir entre conexão celular vs WiFi.

Link: https://pub.dev/packages/connectivity_plus

# Cupertino_icons:
- Este é um repositório de ativos que contém o conjunto padrão de ativos de ícones usados ​​pelos widgets Cupertino do Flutter.

# Chewie:
- O plug-in video_player fornece acesso de baixo nível à reprodução de vídeo. Chewie usa o video_player sob o capô e o envolve em uma interface amigável de Material ou Cupertino!

# Charts_flutter:
- Biblioteca de visualização de dados do Material Design escrita nativamente em Dart.
Link: https://pub.dev/packages/charts_flutter

# dropdownfield2:
- Widget Flutter personalizado para um campo suspenso personalizável com funcionalidade de preenchimento automático Este widget deve ser usado em um formulário Flutter

Link: https://pub.dev/packages/dropdownfield2

# dropdown_formfield:
- A dropdown form field using a dropdown button inside a form field.
Link: https://pub.dev/packages/dropdown_formfield

# Font_awesome_flutter:
O pacote Font Awesome Icon está disponível como um conjunto de ícones Flutter.

Baseado em Font Awesome 6.1.0. Inclui todos os ícones gratuitos:

Regular
Solid
Brands

Link: https://pub.dev/packages/font_awesome_flutter

# Flutter_form_builder
- Este pacote ajuda na criação de formulários de coleta de dados no Flutter, removendo o clichê necessário para criar um formulário, validar campos, reagir a alterações e coletar a entrada do usuário final.

Também estão incluídos campos de entrada de formulário prontos para o FormBuilder. Isso oferece uma maneira conveniente de adicionar campos de entrada prontos comuns em vez de criar seu próprio FormBuilderField do zero.

Link: https://pub.dev/packages/flutter_form_builder

# flutter_launcher_icons:
- A command-line tool which simplifies the task of updating your Flutter app's launcher icon. Fully flexible, allowing you to choose what platform you wish to update the launcher icon for and if you want, the option to keep your old launcher icon in case you want to revert back sometime in the future.

Link: https://pub.dev/packages/flutter_launcher_icons

# firebase_messaging: 
O Firebase Cloud Messaging (FCM) é uma solução de mensagens multiplataforma que permite enviar mensagens de forma confiável e sem custo.

Usando o FCM, você pode notificar um aplicativo cliente de que novos e-mails ou outros dados estão disponíveis para sincronização. Você pode enviar mensagens de notificação para estimular o reengajamento e a retenção do usuário. Para casos de uso como mensagens instantâneas, uma mensagem pode transferir uma carga útil de até 4 KB para um aplicativo cliente.

Link: https://pub.dev/documentation/firebase_messaging/latest/

# firebase_core:

# firebase_auth:

# image_picker:

# image:

# location: 

# rxdart: 

# mask_text_input_formatter:

# provider:

# path_provider:

# sqflite:

# shimmer:

# thumbnailer:

# url_launcher:

# video_player:

# transparent_image:

# zoom_widget:

