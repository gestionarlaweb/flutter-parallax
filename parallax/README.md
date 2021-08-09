# parallax

Efecto Parallax
!(/assets/images/imageApp.png)

## Sobre la App

Esta pequeña aplicación muestra el efecto Scroll en movimiento horizontal
de una manera suave y agradable.

Le pasamos la lista de imagenes
```
List<Map> list_images = [
  {'image': 'assets/images/image1.jpeg', 'name': 'Image 1'},
  {'image': 'assets/images/image2.jpeg', 'name': 'Image 2'},
  {'image': 'assets/images/image3.jpeg', 'name': 'Image 3'},
  {'image': 'assets/images/image4.jpeg', 'name': 'Image 4'},
  {'image': 'assets/images/image5.jpeg', 'name': 'Image 5'},
  {'image': 'assets/images/image6.jpeg', 'name': 'Image 6'},
];
```

Aquí está la mágia. Esto le dará un efecto de suavidad al deslizar el scroll
```
alignment:
  Alignment(-pageOffset.abs() + i, 0),
```
!(/assets/images/video.gif)