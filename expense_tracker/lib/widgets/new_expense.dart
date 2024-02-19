import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //opción para guardar las varibles de manera manual
  /*var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }*/
  //Esto a un objeto que está optimizado para manejar la entrada del usuario
  final _titleController = TextEditingController();
  final _AmountController = TextEditingController();
  DateTime? _selectecDate;
  Category _selectedCategory = Category.leisure;

  //al usar TextEditingControler() hay que poner el método de abajo override para borrar ese Text cuando el widget ya no sea visible
  @override
  void dispose() {
    _titleController.dispose();
    _AmountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectecDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    //con el double.tryParse una cadena se vuelve double
    final enteredAmount = double.tryParse(_AmountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    //valida que el titulo no este vacio
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectecDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid imput'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectecDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    //acá se obtiene el tamaño del teclado que superoppne la interfaz
    final keyboarSpace = MediaQuery.of(context).viewInsets.bottom;
    //Esto poner todo responsive
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        //pone un scroll
        return SizedBox(
          //ocupa todo el espacio que pued eocupar
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboarSpace + 16),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            //opción manual
                            //onChanged: _saveTitleInput,
                            controller: _titleController,
                            maxLength: 50,
                            //se usa para poner un texto encima del campo para que la persona sepa que debe escribir
                            decoration: const InputDecoration(
                              label: Text('Title'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                      ],
                    )
                  else
                    //permite entrada de texto
                    TextField(
                      //opción manual
                      //onChanged: _saveTitleInput,
                      controller: _titleController,
                      maxLength: 50,
                      //se usa para poner un texto encima del campo para que la persona sepa que debe escribir
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                  if(width >= 600)
                    Row(children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (Category) => DropdownMenuItem(
                                value: Category,
                                child: Text(
                                  Category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectecDate == null
                                    ? 'No date selected'
                                    : formatter.format(_selectecDate!),
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        )
                    ],)
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _AmountController,
                            //restringe el tipo de información que se peude escribir (ej: numeros, emails, name, etc)
                            keyboardType: TextInputType.number,
                            //se usa para poner un texto encima del campo para que la persona sepa que debe escribir
                            decoration: const InputDecoration(
                              //funciona para poner algo fijo en etse caso '$' y como es un simbolo especial se pone barra invertida
                              prefixText: '\$ ',
                              label: Text('Amount'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectecDate == null
                                    ? 'No date selected'
                                    : formatter.format(_selectecDate!),
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (Category) => DropdownMenuItem(
                                value: Category,
                                child: Text(
                                  Category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          //elimina la pantalla de superposición
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expenses'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
