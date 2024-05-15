import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/core/constants/strings.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/screens/kanban/cubit/kanban_form_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban/presentation/utils/app_texts.dart';

class KanbanForm extends StatefulWidget {
  const KanbanForm({super.key});

  @override
  State<KanbanForm> createState() => _KanbanFormState();
}

class _KanbanFormState extends State<KanbanForm> {
  TextEditingController taskLabelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocBuilder<KanbanFormCubit, KanbanFormState>(
  builder: (context, kanbanFormState) {
    return SafeArea(
            child: Scaffold(
              backgroundColor: appThemeState.themeClass.backgroundColor,
              appBar: AppBar(
                backgroundColor: appThemeState.themeClass.appbarBackgroundColor,
                leading: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: appThemeState.themeClass.iconPrimary,)),
                title: AppTexts.headingText(
                    textProperties: TextProperties(text: Strings.kanbanForm)),),
              body: Form(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: kanbanFormState.taskLabelController,
                        style: TextStyle(
                          color: appThemeState.themeClass.textColorPrimary,
                        ),
                        decoration: InputDecoration(
                          fillColor: appThemeState.themeClass.formFieldBackgroundColor,
                          hintText: 'Task Label',
                          hintStyle: TextStyle(
                              color: appThemeState.themeClass.textCaptionColor,
                              fontSize: 12,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                width: 1,
                                color: appThemeState.themeClass.dangerColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(width: 1,
                                color: appThemeState.themeClass.
                                focusedFormFieldBorderColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1,
                                  color: appThemeState.themeClass.
                                  enabledFormFieldBorderColor,
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: appThemeState.themeClass.formFieldBackgroundColor,
                          border: Border.all(color: appThemeState.themeClass.enabledFormFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: kanbanFormState.user,
                            isExpanded:true,
                              dropdownColor: appThemeState.themeClass.formFieldBackgroundColor,
                              items: [
                            DropdownMenuItem(
                              value: users[0],
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24,
                                                ),
                                            ),
                                        ),
                                        child: Image.asset(
                                          users[0].image,
                                          width: 24, height: 24,
                                        ),
                                    ),
                                    const SizedBox(width: 8),
                                    AppTexts.normalText(
                                        textProperties: TextProperties(
                                            text: users[0].name,
                                            textColor: appThemeState.themeClass.textColorPrimary,
                                        ),
                                    )
                                  ],
                                )
                            ),
                            DropdownMenuItem(
                                value: users[1],
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24,
                                                ),
                                            ),
                                        ),
                                        child: Image.asset(
                                          users[1].image,
                                          width: 24, height: 24,
                                        ),
                                    ),
                                    const SizedBox(width: 8),
                                    AppTexts.normalText(
                                        textProperties: TextProperties(
                                            text: users[1].name,
                                            textColor: appThemeState.themeClass.textColorPrimary,
                                        ),
                                    )
                                  ],
                                )
                            ),
                            DropdownMenuItem(
                                value: users[2],
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24,
                                                ),
                                            ),
                                        ),
                                        child: Image.asset(
                                          users[2].image,
                                          width: 24, height: 24,
                                        ),
                                    ),
                                    const SizedBox(width: 8),
                                    AppTexts.normalText(
                                        textProperties: TextProperties(
                                            text: users[2].name,
                                            textColor: appThemeState.themeClass.textColorPrimary,
                                        ),
                                    )
                                  ],
                                )
                            ),
                            DropdownMenuItem(
                                value: users[3],
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24,
                                                ),
                                            ),
                                        ),
                                        child: Image.asset(
                                          users[3].image,
                                          width: 24, height: 24,
                                        ),
                                    ),
                                    const SizedBox(width: 8),
                                    AppTexts.normalText(
                                        textProperties: TextProperties(
                                            text: users[3].name,
                                            textColor: appThemeState.themeClass.textColorPrimary,
                                        ),
                                    )
                                  ],
                                )
                            ),
                          ],
                              onChanged: (v){
                                BlocProvider.of<KanbanFormCubit>(context).
                                updateUser(v!);
                              },
                            hint: AppTexts.captionText(
                                textProperties: TextProperties(
                                    text: 'Select User',
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<KanbanFormCubit>(context).addTask(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: appThemeState.themeClass.
                            buttonBackgroundColorPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                          ),
                          child: AppTexts.headingText(
                              textProperties: TextProperties(
                                  text: 'Add Task'
                              ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        );
  },
);
      },
    );
  }
}
