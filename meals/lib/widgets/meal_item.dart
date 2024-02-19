import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget{
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal
    });

  final Meal meal;
  final void Function() onSelectedMeal;

  String get complexityText{
    //aca estamos ingresando al nombre de complexity y a la primera letra de ese nombre para volverla mayuscula y el substring inicia la cadena desde elcaracter 1 
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get afordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onSelectedMeal,
        //Stack pone un elemento encima de otro
        child: Stack(
          children: [
            //permite poner una imagen trnasparente
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                //la imagen sera sacada de internet
                image: NetworkImage(meal.imageUrl),
                //hace que la imagen no se distorsione si no cabe en el recuadro la recorta y hace que se vea bien
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      //como pusimos que maximo son 2 lineas el texto esto hace que se corte de la mejor manenra
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: afordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}