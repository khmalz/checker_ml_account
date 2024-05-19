import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 45),
            decoration: BoxDecoration(
              color: Colors.indigo.shade700,
              borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 95),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child:
                              Icon(Icons.person, color: Colors.white, size: 26),
                        ),
                        SizedBox(width: 10),
                        Text('Hi, Man',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.indigo[700],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Search Mobile Legend Account Here",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => TextField(
                    controller: controller.id,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      value.isNotEmpty ? controller.errorId.value = null : null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      hintText: "Input ID",
                      hintStyle: TextStyle(
                          color: controller.errorServer.value != null
                              ? Colors.red
                              : Colors.grey[400],
                          fontSize: 18),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      errorText: controller.errorId.value,
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 14),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => TextField(
                    controller: controller.server,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      value.isNotEmpty
                          ? controller.errorServer.value = null
                          : null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      hintText: "Input Server",
                      hintStyle: TextStyle(
                        color: controller.errorServer.value != null
                            ? Colors.red
                            : Colors.grey[400],
                        fontSize: 18,
                      ),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      errorText: controller.errorServer.value,
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 14),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => OutlinedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.getAccount,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.white),
                          ),
                        ),
                        child: Text(
                          controller.isLoading.value ? 'Loading...' : 'Search',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: controller.resetForm,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            if (!controller.isSubmit.value) {
              return const SizedBox();
            }

            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.account.value == null) {
              return const Center(
                child: Text(
                  'No Result Found',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  const Text('Hasil Pencarian', style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 15),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        'ID : ${controller.account.value!.userId!}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "Username : ${controller.account.value!.username!}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
