import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonScreen extends StatelessWidget {

  static const String routeName = 'buttons';
  
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
      )
    );
  }
}

class _ButtonView extends StatelessWidget {

  const _ButtonView();

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon')
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: (){},
              icon: const Icon( Icons.access_time_filled_rounded ),
              label: const Text('Filled Icon')
            ),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon( Icons.accessibility_new_outlined ),
              label: const Text('Outlined Icon')
            ),
            TextButton(onPressed: (){}, child: const Text('TextButton')),
            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.account_box),
              label: const Text('Text Icon')
            ),
            // TODO: custom button
            IconButton(onPressed: (){}, icon: const Icon( Icons.zoom_out )),
            IconButton(
              onPressed: (){},
              icon: const Icon( Icons.zoom_out ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll( colorTheme.primary ),
                iconColor: const WidgetStatePropertyAll( Colors.white )
              ),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }

}

class CustomButton extends StatelessWidget {

  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final colorsTheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Material(
        color: colorsTheme.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle( color: Colors.white ),
            ),
          ),
        ),
      ),
    );
  }

}