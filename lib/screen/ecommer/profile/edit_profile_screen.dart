import 'package:flutter_new_architectua/widget/loading_button.dart';
import 'package:flutter_new_architectua/widget/profile/custom_textfield_widget.dart';
import 'package:flutter_new_architectua/widget/profile/edit_avatar_widget.dart';
import 'package:flutter_new_architectua/widget/profile/edit_birthday_widget.dart';
import 'package:flutter_new_architectua/widget/profile/edit_country_widget.dart';
import 'package:flutter_new_architectua/widget/profile/edit_gender_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  int _genderIndex = 0;
  DateTime? _selectedDate;
  String _region = '';

  bool isInitialized = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeaderWidget(
            leftIcon: 'assets/icons/left_arrow_icon.svg', title: 'EditProfile'),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (isInitialized) {
              _genderIndex = state.profile.gender ?? 0;
              _selectedDate = DateTime.parse(state.profile.dateOfBirth ?? '');
              _region = state.profile.region ?? '';
              isInitialized = false;
            }

            Future<void> selectDate(BuildContext context) async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.parse(state.profile.dateOfBirth ?? ''),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100));
              if (picked != null && picked != _selectedDate) {
                setState(() {
                  _selectedDate = picked;
                });
              }
            }

            Future<void> saveChanges() async {}

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const EditAvatarWidget(
                            avatarUrl: 'https://picsum.photos/id/237/200/300',
                          ),
                          const SizedBox(height: 20),
                          CustomTextFieldWidget(
                              controller: _nameController, label: 'Name'),
                          CustomTextFieldWidget(
                              controller: _emailController, label: 'Email'),
                          CustomTextFieldWidget(
                              controller: _phoneNumberController,
                              label: 'Phone Number',
                              isEnterNumberOnly: true),
                          EditGenderWidget(
                              genderIndex: _genderIndex,
                              handleChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _genderIndex = genderList.indexOf(newValue);
                                  });
                                }
                              }),
                          const SizedBox(height: 4),
                          EditBirthdayWidget(
                              selectDate: selectDate,
                              selectedDate: _selectedDate),
                          const SizedBox(height: 4),
                          EditCountryWidget(
                              region: _region,
                              handleSelect: (Country country) {
                                setState(() {
                                  _region = country.displayNameNoCountryCode;
                                });
                              }),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: LoadingButtonWidget(
                                onPressed: saveChanges, text: 'Save Changes'),
                          )
                        ],
                      ),
                    ),
                  )),
            );
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
  }
}
