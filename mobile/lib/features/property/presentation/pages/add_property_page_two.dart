import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/property/presentation/widgets/property_input_field_widget.dart';

import '../../../../../../../../config/theme/app_colors.dart';
import '../../../../../../../../core/constant/app_icons.dart';
import '../../../../../../../../core/constant/images_path.dart';
import '../../../../../../../../core/constant/strings.dart';
import '../../../../../../../../core/widget/app_button.dart';
import '../../../../config/routes/routes_names.dart';
import '../widgets/card_wiget.dart';
import '../widgets/header_widget.dart';
import '../widgets/submit_button_widget.dart';

class AddPropertyScreenTwo extends StatefulWidget {
  const AddPropertyScreenTwo({super.key});

  @override
  State<AddPropertyScreenTwo> createState() => _AddPropertyScreenTwoState();
}

class _AddPropertyScreenTwoState extends State<AddPropertyScreenTwo> {
  final TextEditingController _customTypeController = TextEditingController();
  @override
  final TextEditingController _buildingNoController = TextEditingController();
  @override
  final TextEditingController _areaController = TextEditingController();
  @override
  final TextEditingController _priceController = TextEditingController();

  @override
  final TextEditingController _floorController = TextEditingController();

  void dispose() {
    _customTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue = "Gaza";
    String? selectedDistrictValue = "Al-Wehda";
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(ImagePath.background, fit: BoxFit.cover),
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                HeaderWidget(
                  title: AppStrings.listYourPropertyPage2Title,
                  subTitle: AppStrings.listYourPropertyStep2,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(45),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _buildCustomCardField(
                                    context,
                                    AppStrings.city,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: DropdownButton<String>(
                                        icon: SvgPicture.asset(
                                          AppIcons.arrowDown,
                                        ),
                                        value: selectedValue,
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.white,
                                              fontSize: 16,
                                            ),
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Gaza',
                                            child: Text('Gaza'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'option2',
                                            child: Text('Option 2'),
                                          ),
                                        ],
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    icon: AppIcons.location,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: _buildCustomCardField(
                                    context,
                                    AppStrings.district,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: DropdownButton<String>(
                                        icon: SvgPicture.asset(
                                          AppIcons.arrowDown,
                                        ),
                                        value: selectedDistrictValue,
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.white,
                                              fontSize: 16,
                                            ),
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Al-Wehda',
                                            child: Text('Al-Wehda'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'option2',
                                            child: Text('Option 2'),
                                          ),
                                        ],
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    icon: AppIcons.district,
                                  ),
                                ),
                              ],
                            ),
                            _buildCustomInputField(
                              context,
                              AppStrings.buildingNumber,

                              AppStrings.buildingNumberHint,

                              _buildingNoController,
                            ),
                            _buildCustomInputField(
                              context,
                              AppStrings.area,
                              AppStrings.areaHint,
                              _areaController,
                            ),

                            _buildCustomInputField(
                              context,
                              AppStrings.price,
                              AppStrings.priceHint,
                              _priceController,
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: _buildCustomCardField(
                                    context,
                                    AppStrings.rooms,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            AppIcons.minus,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            '1',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: AppColors.white,
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(AppIcons.plus),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: _buildCustomCardField(
                                    context,
                                    AppStrings.bathrooms,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            AppIcons.minus,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            '1',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: AppColors.white,
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(AppIcons.plus),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _buildCustomInputField(
                              context,
                              AppStrings.floor,
                              AppStrings.floorHint,
                              _floorController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SubmitButtonWidget(
                  onPressed: () {
                    context.push(RouteNames.addPropertyScreenThree);
                  },
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomInputField(
    BuildContext context,
    String title,
    String hint,
    TextEditingController controller, {
    String? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              if (icon != null) ...[SvgPicture.asset(icon), SizedBox(width: 8)],
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          PropertyInputFieldWidget(controller: controller, hint: hint),
        ],
      ),
    );
  }

  _buildCustomCardField(
    BuildContext context,
    String title,
    Widget widget, {
    String? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              if (icon != null) ...[SvgPicture.asset(icon), SizedBox(width: 8)],
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          CardWidget(widget: widget, isSelected: false, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AppElevatedButton(
        text: AppStrings.continueText,
        height: 56,
        width: double.infinity,
        borderRadius: 999,
        backgroundColor: AppColors.primaryDark,
        onPressed: () {
          // Business logic / Navigation to next step
        },
      ),
    );
  }
}
