// import 'package:iq_racer/src/models/option.dart';
// import 'package:iq_racer/src/models/question.dart';

// final preguntesCiencia = [
//   Question(
//     text: '¿En matemáticas, ¿qué es 3,14 ?',
//     options: [
//       const Option(code: 'A', text: 'Una matriz', isCorrect: false),
//       const Option(code: 'B', text: 'PI', isCorrect: true),
//       const Option(code: 'C', text: 'Número PRT', isCorrect: false),
//       const Option(code: 'D', text: 'Un residuo', isCorrect: false),
//     ],
//     solution: 'En mateáticas, 3,14 es el número PI',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué estudia la topografía?',
//     options: [
//       const Option(code: 'A', text: 'El cielo', isCorrect: false),
//       const Option(code: 'B', text: 'El fondo marino', isCorrect: false),
//       const Option(
//           code: 'C',
//           text: 'La representación subterranea de la Tierra',
//           isCorrect: false),
//       const Option(
//           code: 'D',
//           text: 'La representación gráfica de la superficie de la Tierra',
//           isCorrect: true),
//     ],
//     solution: 'La topografía estudia la superficie terrestre',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué órgano es el encargado de fabricar insulina?',
//     options: [
//       const Option(code: 'A', text: 'Hígado', isCorrect: false),
//       const Option(code: 'B', text: 'Riñón', isCorrect: false),
//       const Option(code: 'C', text: 'Pulmón', isCorrect: false),
//       const Option(code: 'D', text: 'Páncreas', isCorrect: true),
//     ],
//     solution: 'El páncreas es el organo encargado de fabricar insulina',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cuántas patas tienen las arañas?',
//     options: [
//       const Option(code: 'A', text: '8', isCorrect: true),
//       const Option(code: 'B', text: '6', isCorrect: false),
//       const Option(code: 'C', text: "12", isCorrect: false),
//       const Option(code: 'D', text: "4", isCorrect: false),
//     ],
//     solution: 'Las arañas tienen 8 patas',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué es la luna?',
//     options: [
//       const Option(code: 'A', text: 'Estrella', isCorrect: false),
//       const Option(code: 'B', text: 'Constelación', isCorrect: false),
//       const Option(code: 'C', text: 'Un satélite', isCorrect: true),
//       const Option(code: 'D', text: 'Planeta', isCorrect: false),
//     ],
//     solution: 'La luna es un satélite',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué es un ser unicelular?',
//     options: [
//       const Option(
//           code: 'A', text: 'Un ser vivo sin células', isCorrect: false),
//       const Option(
//           code: 'B', text: 'Un ser vivo de dos células', isCorrect: false),
//       const Option(
//           code: 'C', text: 'Un ser vivo de una célula', isCorrect: true),
//       const Option(
//         code: 'D',
//         text: 'Un ser vivo de 1000 células',
//         isCorrect: false,
//       ),
//     ],
//     solution: 'Los seres unicelulares son aquellos que tienen una célula',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué símbolo tiene el niobio en la tabla periódica?',
//     options: [
//       const Option(code: 'A', text: 'NiO', isCorrect: false),
//       const Option(code: 'B', text: 'BiB', isCorrect: false),
//       const Option(code: 'C', text: 'Bn', isCorrect: false),
//       const Option(code: 'D', text: 'Nb', isCorrect: true),
//     ],
//     solution: 'El niobio se representa en la tabla periódica con el símbolo Nb',
//     selectedOption: null,
//   ),
// ];
// final preguntesDeportes = [
//   Question(
//     text: '¿Cuál es el nombre de pila del tenista Federer??',
//     options: [
//       const Option(code: 'A', text: 'Frederic', isCorrect: false),
//       const Option(code: 'B', text: 'Roger', isCorrect: true),
//       const Option(code: 'C', text: 'Kevin', isCorrect: false),
//       const Option(code: 'D', text: 'Marc', isCorrect: false),
//     ],
//     solution: 'El nombre del tenista es Roger Federer',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿A qué deporte pertenece la WWE?',
//     options: [
//       const Option(code: 'A', text: 'Futbol', isCorrect: false),
//       const Option(code: 'B', text: 'Tenis', isCorrect: false),
//       const Option(code: 'C', text: 'Golf', isCorrect: false),
//       const Option(code: 'D', text: 'Lucha libre', isCorrect: true),
//     ],
//     solution: 'La WWE pertenece al deporte de lucha libre',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En qué país ganó Alemania su primer mundial de fútbol?',
//     options: [
//       const Option(code: 'A', text: 'Francia', isCorrect: false),
//       const Option(code: 'B', text: 'Argentina', isCorrect: false),
//       const Option(code: 'C', text: 'Italia', isCorrect: false),
//       const Option(code: 'D', text: 'Suiza', isCorrect: true),
//     ],
//     solution: 'Alemania ganó su primer mundial en Suiza',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Quién fue el primer jugador que recibió la distinción de "Mejor Jugador del Siglo"?',
//     options: [
//       const Option(code: 'A', text: 'Pelé', isCorrect: true),
//       const Option(code: 'B', text: 'Johann Cruyff', isCorrect: false),
//       const Option(code: 'C', text: "Cristiano Ronaldo", isCorrect: false),
//       const Option(code: 'D', text: "Maradona", isCorrect: false),
//     ],
//     solution:
//         'El primer jugador en recibir la distinción de "Mejor Jugador del Siglo" fue Pelé',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cómo se llama el lugar destinado a las carreras de caballos?',
//     options: [
//       const Option(code: 'A', text: 'Hipòligo', isCorrect: false),
//       const Option(code: 'B', text: 'Hipódrago', isCorrect: false),
//       const Option(code: 'C', text: 'Hipódromo', isCorrect: true),
//       const Option(code: 'D', text: 'Caballero', isCorrect: false),
//     ],
//     solution: 'El hipódromo es el lugar destinado a las carreras de caballos',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Quién tiene más balones de oro?',
//     options: [
//       const Option(code: 'A', text: 'Cristiano Ronaldo', isCorrect: false),
//       const Option(code: 'B', text: 'Maradona', isCorrect: false),
//       const Option(code: 'C', text: 'Lionel Messi', isCorrect: true),
//       const Option(
//         code: 'D',
//         text: 'Zidane',
//         isCorrect: false,
//       ),
//     ],
//     solution: 'Lionel Messi es el jugador con mas balones de oro',
//     selectedOption: null,
//   ),
//   Question(
//     text: 'Estilo de atletismo en el que los corredores llevan un testigo:',
//     options: [
//       const Option(code: 'A', text: 'Carreras de velocidad', isCorrect: false),
//       const Option(code: 'B', text: 'Carreras en ruta', isCorrect: false),
//       const Option(code: 'C', text: 'Salto con pértiga', isCorrect: false),
//       const Option(code: 'D', text: 'Relevo', isCorrect: true),
//     ],
//     solution: 'Los atletas usan testigos en el estilo de relevos',
//     selectedOption: null,
//   ),
// ];
// final preguntesHistoria = [
//   Question(
//     text: '¿Qué civilización antigua tenía faraones como gobernantes?',
//     options: [
//       const Option(code: 'A', text: 'Japón', isCorrect: false),
//       const Option(code: 'B', text: 'Egipto', isCorrect: true),
//       const Option(code: 'C', text: 'Mongólia', isCorrect: false),
//       const Option(code: 'D', text: 'Babilonia', isCorrect: false),
//     ],
//     solution: 'Egipto es el país que tenía faraones como gobernantes',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cuál es la comida típica madrileña?',
//     options: [
//       const Option(code: 'A', text: 'La paella', isCorrect: false),
//       const Option(code: 'B', text: 'Pan con tomáte', isCorrect: false),
//       const Option(code: 'C', text: 'Bocadillo de calamares', isCorrect: false),
//       const Option(code: 'D', text: 'El cocido', isCorrect: true),
//     ],
//     solution: 'El cocido es la comida típica madrileña',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿A qué representan las K de un juego de naipes?',
//     options: [
//       const Option(code: 'A', text: 'A los príncipes', isCorrect: false),
//       const Option(code: 'B', text: 'A la Reina', isCorrect: false),
//       const Option(
//           code: 'D', text: 'A los cuatro grandes reyes', isCorrect: true),
//       const Option(
//           code: 'C', text: 'Ninguna de las anteriores', isCorrect: false),
//     ],
//     solution:
//         'La K de un juego de naipes representa a los cuatro grandes reyes',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cuándo se produjo la Batalla de Las Piedras?',
//     options: [
//       const Option(code: 'A', text: '1811', isCorrect: true),
//       const Option(code: 'B', text: '1802', isCorrect: false),
//       const Option(code: 'C', text: "1904", isCorrect: false),
//       const Option(code: 'D', text: "1714", isCorrect: false),
//     ],
//     solution: 'La batalla de las piedras se produjo en el año 1811',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cuál es la ideología opuesta al Comunismo?',
//     options: [
//       const Option(code: 'A', text: 'Anarquía', isCorrect: false),
//       const Option(code: 'B', text: 'Socialismo', isCorrect: false),
//       const Option(code: 'C', text: 'Capitalismo', isCorrect: true),
//       const Option(code: 'D', text: 'Todas son correctas', isCorrect: false),
//     ],
//     solution: 'La ideología opuesta al Comunismo es el Capitalismo',
//     selectedOption: null,
//   ),
//   Question(
//     text: 'En la antigua Grecia, como participaban en los juegos olímpicos?',
//     options: [
//       const Option(code: 'A', text: 'Vestidos con cuero', isCorrect: false),
//       const Option(code: 'B', text: 'Con Armaduras', isCorrect: false),
//       const Option(code: 'C', text: 'Desnudos', isCorrect: true),
//       const Option(
//         code: 'D',
//         text: 'Depende de la época del año',
//         isCorrect: false,
//       ),
//     ],
//     solution:
//         'En la antigua Grecia, los participantes de los juegos olímpicos, lo hacían desnudos',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Qué país reconoció Italia a través de los Pactos de Letrán de 1929?',
//     options: [
//       const Option(code: 'A', text: 'Suiza', isCorrect: false),
//       const Option(code: 'B', text: 'Portugal', isCorrect: false),
//       const Option(code: 'C', text: 'España', isCorrect: false),
//       const Option(code: 'D', text: 'La Ciudad del Vaticano', isCorrect: true),
//     ],
//     solution: 'Italia reconoció La Ciudad del Vaticano como país',
//     selectedOption: null,
//   ),
// ];
// final preguntesGeografia = [
//   Question(
//     text: '¿Cuál es el área urbana más poblada de la India?',
//     options: [
//       const Option(code: 'A', text: 'Bangalore', isCorrect: false),
//       const Option(code: 'B', text: 'Bombay', isCorrect: true),
//       const Option(code: 'C', text: 'Delhi', isCorrect: false),
//       const Option(code: 'D', text: 'Calcuta', isCorrect: false),
//     ],
//     solution: 'El area urbana más poblada de la India es Bombay',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En qué provincia se encuentra Elche?',
//     options: [
//       const Option(code: 'A', text: 'Barcelona', isCorrect: false),
//       const Option(code: 'B', text: 'Lugo', isCorrect: false),
//       const Option(code: 'C', text: 'Sevilla', isCorrect: false),
//       const Option(code: 'D', text: 'Alicante', isCorrect: true),
//     ],
//     solution: 'Elche se encuentra en la provincia de Alicante',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cuál es la moneda oficial de Costa Rica?',
//     options: [
//       const Option(code: 'A', text: 'Rublo', isCorrect: false),
//       const Option(code: 'B', text: 'Dolar', isCorrect: false),
//       const Option(code: 'C', text: 'Euro', isCorrect: false),
//       const Option(code: 'D', text: 'Colón costarricense', isCorrect: true),
//     ],
//     solution: 'La moneda oficial de Costa Rica es el Colón costarricense',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Dónde se encuentra la isla de Koh Samui?',
//     options: [
//       const Option(code: 'A', text: 'Tailandia', isCorrect: true),
//       const Option(code: 'B', text: 'Japón', isCorrect: false),
//       const Option(code: 'C', text: "China", isCorrect: false),
//       const Option(code: 'D', text: "Australia", isCorrect: false),
//     ],
//     solution: 'La isla de Koh Samuii se encuentra en Tailandia',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cuál es la capital de Uruguay?',
//     options: [
//       const Option(code: 'A', text: 'Bogotá', isCorrect: false),
//       const Option(code: 'B', text: 'Buenos Aires', isCorrect: false),
//       const Option(code: 'C', text: 'Montevideo', isCorrect: true),
//       const Option(code: 'D', text: 'Quito', isCorrect: false),
//     ],
//     solution: 'La capital de Uruguay es Montevideo',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Dónde se encuentra el río Nilo?',
//     options: [
//       const Option(code: 'A', text: 'En Europa', isCorrect: false),
//       const Option(code: 'B', text: 'En Ásia', isCorrect: false),
//       const Option(code: 'C', text: 'En África', isCorrect: true),
//       const Option(
//         code: 'D',
//         text: 'En Australia',
//         isCorrect: false,
//       ),
//     ],
//     solution: 'El río Nilo se encuentra en África',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Dónde se encuentra la villa portuaria más antigua de Francia?',
//     options: [
//       const Option(code: 'A', text: 'Niza', isCorrect: false),
//       const Option(code: 'B', text: 'París', isCorrect: false),
//       const Option(code: 'C', text: 'Toulouse', isCorrect: false),
//       const Option(code: 'D', text: 'Marseille', isCorrect: true),
//     ],
//     solution:
//         'La villa potuaria más antigua de Francia se encuentra en Marseille',
//     selectedOption: null,
//   ),
// ];
// final preguntesEntretenimiento = [
//   Question(
//     text: '¿Quién era Jay-Jay?',
//     options: [
//       const Option(code: 'A', text: 'Earth', isCorrect: false),
//       const Option(code: 'B', text: 'Un avioncito', isCorrect: true),
//       const Option(code: 'C', text: 'Jupiter', isCorrect: false),
//       const Option(code: 'D', text: 'Saturn', isCorrect: false),
//     ],
//     solution: 'Venus is the hottest planet in the solar system',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Qué capitán pirata es una mezcla de criaturas del mar y forma humana en las películas de Piratas del Caribe?',
//     options: [
//       const Option(code: 'A', text: '1', isCorrect: false),
//       const Option(code: 'B', text: '2', isCorrect: false),
//       const Option(code: 'C', text: '5', isCorrect: false),
//       const Option(code: 'D', text: 'Davy Jones', isCorrect: true),
//     ],
//     solution: '¿Quién es el creador del talent show "The X Factor"?',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Cómo se llama el personaje del videojuego Grand Theft Auto IV?',
//     options: [
//       const Option(code: 'A', text: 'N', isCorrect: false),
//       const Option(code: 'B', text: 'S', isCorrect: false),
//       const Option(code: 'C', text: 'P', isCorrect: false),
//       const Option(code: 'D', text: 'Niko', isCorrect: true),
//     ],
//     solution:
//         '¿Qué compañía multinacional compró al sistema de mensajería WhatsApp',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué fruta es la casa de Bob Esponja?',
//     options: [
//       const Option(code: 'A', text: 'Una piña', isCorrect: true),
//       const Option(code: 'B', text: 'Hamilton', isCorrect: false),
//       const Option(code: 'C', text: "Much Ado About Nothing", isCorrect: false),
//       const Option(code: 'D', text: "The Birthday Party", isCorrect: false),
//     ],
//     solution: '4.48 Psychosis is the correct answer for this question',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Quién es el marido de la actriz Angelina Jolie?',
//     options: [
//       const Option(code: 'A', text: '2005', isCorrect: false),
//       const Option(code: 'B', text: '2008', isCorrect: false),
//       const Option(code: 'C', text: 'Brad Pitt', isCorrect: true),
//       const Option(code: 'D', text: '2006', isCorrect: false),
//     ],
//     solution: 'iPhone was first released in 2007',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Cómo se llama la actriz que interpreta a una pequeña vampira en "Entrevista con el vampiro"?',
//     options: [
//       const Option(code: 'A', text: 'Carbon', isCorrect: false),
//       const Option(code: 'B', text: 'Oxygen', isCorrect: false),
//       const Option(code: 'C', text: 'Kirsten Dunst', isCorrect: true),
//       const Option(
//         code: 'D',
//         text: 'Pottasium',
//         isCorrect: false,
//       ),
//     ],
//     solution: 'Calcium is the element responsible for keeping the bones strong',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En la serie Los Simpson de qué color son las perlas de Lisa?',
//     options: [
//       const Option(code: 'A', text: 'Brazil', isCorrect: false),
//       const Option(code: 'B', text: 'Germany', isCorrect: false),
//       const Option(code: 'C', text: 'Italy', isCorrect: false),
//       const Option(code: 'D', text: 'Blancas', isCorrect: true),
//     ],
//     solution: 'Uruguay was the first country to win world cup',
//     selectedOption: null,
//   ),
// ];
// final preguntesArte = [
//   Question(
//     text: '¿Quién escribió Azazel?',
//     options: [
//       const Option(code: 'A', text: 'Earth', isCorrect: false),
//       const Option(code: 'B', text: 'Venus', isCorrect: true),
//       const Option(code: 'C', text: 'Jupiter', isCorrect: false),
//       const Option(code: 'D', text: 'Saturn', isCorrect: false),
//     ],
//     solution: 'Venus is the hottest planet in the solar system',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En qué isla vivía Otelo?',
//     options: [
//       const Option(code: 'A', text: '1', isCorrect: false),
//       const Option(code: 'B', text: '2', isCorrect: false),
//       const Option(code: 'C', text: '5', isCorrect: false),
//       const Option(code: 'D', text: '3', isCorrect: true),
//     ],
//     solution: '¿Quién es el creador del talent show "The X Factor"?',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Cuál es el nombre del primer gran poema épico de la literatura inglesa?',
//     options: [
//       const Option(code: 'A', text: 'N', isCorrect: false),
//       const Option(code: 'B', text: 'S', isCorrect: false),
//       const Option(code: 'C', text: 'P', isCorrect: false),
//       const Option(code: 'D', text: 'K', isCorrect: true),
//     ],
//     solution:
//         '¿Qué compañía multinacional compró al sistema de mensajería WhatsApp',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Quién pintó "Mujer mirando por la ventana"?',
//     options: [
//       const Option(code: 'A', text: '4.48 Psychosis', isCorrect: true),
//       const Option(code: 'B', text: 'Hamilton', isCorrect: false),
//       const Option(code: 'C', text: "Much Ado About Nothing", isCorrect: false),
//       const Option(code: 'D', text: "The Birthday Party", isCorrect: false),
//     ],
//     solution: '4.48 Psychosis is the correct answer for this question',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En qué ciudad nació el pintor y escultor Joan Miro?',
//     options: [
//       const Option(code: 'A', text: '2005', isCorrect: false),
//       const Option(code: 'B', text: '2008', isCorrect: false),
//       const Option(code: 'C', text: '2007', isCorrect: true),
//       const Option(code: 'D', text: '2006', isCorrect: false),
//     ],
//     solution: 'iPhone was first released in 2007',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En qué ciudad nació el pintor y escultor Joan Miro?',
//     options: [
//       const Option(code: 'A', text: 'Carbon', isCorrect: false),
//       const Option(code: 'B', text: 'Oxygen', isCorrect: false),
//       const Option(code: 'C', text: 'Calcium', isCorrect: true),
//       const Option(
//         code: 'D',
//         text: 'Pottasium',
//         isCorrect: false,
//       ),
//     ],
//     solution: 'Calcium is the element responsible for keeping the bones strong',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Cuál de los siguientes personajes no aparece en la portada del álbum Sgt. Peppers Lonely Hearts Club Band, de la banda británica The Beatles?',
//     options: [
//       const Option(code: 'A', text: 'Brazil', isCorrect: false),
//       const Option(code: 'B', text: 'Germany', isCorrect: false),
//       const Option(code: 'C', text: 'Italy', isCorrect: false),
//       const Option(code: 'D', text: 'Uruguay', isCorrect: true),
//     ],
//     solution: 'Uruguay was the first country to win world cup',
//     selectedOption: null,
//   ),
// ];
// final preguntesTecnologia = [
//   Question(
//     text: '¿Qué tecnología se utiliza para registrar las transacciones de criptomonedas?',
//     options: [
//       const Option(code: 'A', text: 'Digital wallet', isCorrect: false),
//       const Option(code: 'B', text: 'Mining', isCorrect: false),
//       const Option(code: 'C', text: 'Blockchain', isCorrect: true),
//       const Option(code: 'D', text: 'Token', isCorrect: false),
//     ],
//     solution: 'Debido al potencial similar para alterar el mundo que nos rodea, Blockchain a menudo se compara con un "segundo Internet".',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Cuál es el nombre del primer lenguaje de programación ampliamente conocido?',
//     options: [
//       const Option(code: 'A', text: 'Matlab', isCorrect: false),
//       const Option(code: 'B', text: 'FORTRAN', isCorrect: true),
//       const Option(code: 'C', text: 'Ada', isCorrect: false),
//       const Option(code: 'D', text: 'COBOL', isCorrect: false),
//     ],
//     solution: 'Con Fortran nació la programación moderna. A través de él se han puesto en práctica conceptos como la computación científica, o la complicación de código, entre otros.',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿En qué año lanzó Apple el Macintosh 128K?',
//     options: [
//       const Option(code: 'A', text: '1983', isCorrect: false),
//       const Option(code: 'B', text: '1984', isCorrect: true),
//       const Option(code: 'C', text: '1977', isCorrect: false),
//       const Option(code: 'D', text: '1999', isCorrect: false),
//     ],
//     solution:
//         'El 24 de enero de 1984.',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué significa el acrónimo FOSS?',
//     options: [
//       const Option(code: 'A', text: 'Free and Open-Source Software', isCorrect: true),
//       const Option(code: 'B', text: 'Full Option Sensor System', isCorrect: false),
//       const Option(code: 'C', text: "Follow-On Support Service", isCorrect: false),
//       const Option(code: 'D', text: "Fiber Optics Science System", isCorrect: false),
//     ],
//     solution: 'En el software libre y de código abierto, "gratis" significa libertad, no precio gratuito.',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué lenguaje de programación es el más utilizado?',
//     options: [
//       const Option(code: 'A', text: 'C#', isCorrect: false),
//       const Option(code: 'B', text: 'Swift', isCorrect: false),
//       const Option(code: 'C', text: 'PHP', isCorrect: false),
//       const Option(code: 'D', text: 'Java', isCorrect: true),
//     ],
//     solution: 'Java es un lenguaje informático universal, lo que significa que no está vinculado a una plataforma o enfoque de programación específico.',
//     selectedOption: null,
//   ),
//   Question(
//     text:
//         '¿Qué tipo de malware está diseñado para aprovechar un agujero de seguridad antes de que se conozca?',
//     options: [
//       const Option(code: 'A', text: 'Zero-day exploit', isCorrect: true),
//       const Option(code: 'B', text: 'Virus', isCorrect: false),
//       const Option(code: 'C', text: 'Ransomware', isCorrect: false),
//       const Option(
//         code: 'D',
//         text: 'Trojan horse',
//         isCorrect: false,
//       ),
//     ],
//     solution: 'En 2017, el corredor de exploits Zerodium anunció que pagará 1 millón en de dólares recompensas por exploits previamente desconocidos dirigidos al navegador Tor.',
//     selectedOption: null,
//   ),
//   Question(
//     text: '¿Qué tecnología se utiliza para hacer posibles las llamadas telefónicas a través de Internet?',
//     options: [
//       const Option(code: 'A', text: 'Bluetooth', isCorrect: false),
//       const Option(code: 'B', text: 'Ethernet', isCorrect: false),
//       const Option(code: 'C', text: 'NFC', isCorrect: false),
//       const Option(code: 'D', text: 'VoIP', isCorrect: true),
//     ],
//     solution: 'La transmisión de Voz sobre Protocolo de Internet (VoIP) comenzó en 1973. Sin embargo, no fue hasta 1995 que apareció el primer software de telefonía por Internet, Vocaltec.',
//     selectedOption: null,
//   ),
// ];
