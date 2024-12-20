import 'package:intl/intl.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/widget/custom_dropdown.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final List<String> genderList = ["Not Selected", "Male", "Female", "Other"];
  int genderIndex = 0;
  bool isInitialized = true;

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeaderWidget(
            leftIcon: 'assets/icons/left_arrow_icon.svg', title: 'EditProfile'),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (isInitialized) {
              genderIndex = state.profile.gender ?? 0;
              _selectedDate = DateTime.parse(state.profile.dateOfBirth ?? '');
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
                              controller: nameController,
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
                              controller: emailController,
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
                              controller: phoneNumberController,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          CustomDropdown(
                            items: genderList,
                            dropdownValue: genderList[genderIndex],
                            handleSelect: (int index) {
                              setState(() {
                                genderIndex = index;
                              });
                            },
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
                                    border: Border.all(color: Colors.grey),
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
                                            fontSize: 16,
                                            color: AppColors.black),
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  )))
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
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }
}
