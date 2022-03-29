// // Copyright (c) 2021, Very Good Ventures
// // https://verygood.ventures
// //
// // Use of this source code is governed by an MIT-style
// // license that can be found in the LICENSE file or at
// // https://opensource.org/licenses/MIT.

// import 'package:ecommerce/counter/counter.dart';
// import 'package:ecommerce/l10n/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterPage extends StatelessWidget {
//   const CounterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CounterCubit(),
//       child: const CounterView(),
//     );
//   }
// }

// class CounterView extends StatelessWidget {
//   const CounterView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               title: Text('data'),
//             ),
//             Text("qwertyu"),
//             Text("qwertyu"),
//             Text("qwertyu"),
//             Text("qwertyu")
//           ],
//         ),
//       ),
//       appBar: AppBar(
//           automaticallyImplyLeading: true,
//           leadingWidth: 70,
//           // leading: IconButton(
//           //     onPressed: () {
//           //       Navigator.pop(context);
//           //     },
//           //     icon: Icon(Icons.alarm_add)),
//           title: Text(l10n.counterAppBarTitle)),
//       body: const Center(child: CounterText()),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => context.read<CounterCubit>().increment(),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 8),
//           FloatingActionButton(
//             onPressed: () => context.read<CounterCubit>().decrement(),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CounterText extends StatelessWidget {
//   const CounterText({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final count = context.select((CounterCubit cubit) => cubit.state);
//     return Text('$count', style: theme.textTheme.headline1);
//   }
// }
