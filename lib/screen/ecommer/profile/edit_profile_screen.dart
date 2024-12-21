import 'package:flutter_new_architectua/widget/loading_button.dart';
import 'package:intl/intl.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';

final List<String> genderList = ["Not Selected", "Male", "Female", "Other"];

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

            Future<void> saveChanges() async {
              
            }

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
                          Center(
                            child: Stack(
                              children: [
                                const CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://picsum.photos/id/237/200/300'),
                                ),
                                Positioned(
                                  right: 4,
                                  bottom: 4,
                                  child: SvgPicture.asset(
                                      'assets/icons/camera_icon.svg'),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(top: 4, bottom: 6),
                            child: TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(top: 4, bottom: 6),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(top: 4, bottom: 6),
                            child: TextField(
                              controller: _phoneNumberController,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(color: AppColors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButton<String>(
                              value: genderList[_genderIndex],
                              items: genderList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: genderList[_genderIndex] == value
                                            ? Colors.black
                                            : AppColors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _genderIndex = genderList.indexOf(newValue!);
                                });
                              },
                              underline: Container(height: 0),
                              isExpanded: true,
                              menuMaxHeight: 200,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Birthday',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                              onTap: () => selectDate(context),
                              child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 4),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.black),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _selectedDate == null
                                            ? "Chưa chọn ngày"
                                            : DateFormat('dd/MM/yyyy')
                                                .format(_selectedDate!),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ))),
                          const SizedBox(height: 4),
                          const Text(
                            'Country/Region',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                onSelect: (Country country) {
                                  setState(() {
                                    _region = country.displayNameNoCountryCode;
                                  });
                                },
                                moveAlongWithKeyboard: false,
                              );
                            },
                            child: Container(
                                width: double.infinity,
                                height: 40,
                                margin: const EdgeInsets.only(top: 4),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.black),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _region,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                )),
                          ),
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
