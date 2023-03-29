import 'package:camera/camera.dart';
import 'package:danim/view_models/record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './record_screen.dart';
import '../module/CupertinoAlertDialog.dart';
import '../view_models/camera_view_model.dart';

class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of로 viewModel 지정
    final viewModel = Provider.of<CameraViewModel>(context, listen: false);
    return Scaffold(
      // FutureBuilder를 사용할 필요가 있는지 검토
      body: FutureBuilder(
        future: viewModel.initializeCamera(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Failed to initialize camera: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return SafeArea(
                child: Scaffold(
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        // 카메라 화면
                        CameraPreview(viewModel.controller),

                        // 버튼들
                        Positioned(
                          // 위치 지정
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 130,
                            color: Colors.black38,
                            child: Column(
                              children: [
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 25.0),
                                      width: 60,
                                      height: 60,
                                    ),
                                    Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(45)),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 70,
                                          ),
                                          onPressed: () {
                                            if (viewModel.allFileList.length <
                                                9) {
                                              viewModel.takePhoto();
                                            } else {
                                              OneButtonCupertinoAlertDiaglog()
                                                  .showFeedBack(context,
                                                      "이미지는 \n최대 9장까지 \n등록 가능합니다.");
                                            }
                                          },
                                        )),
                                    Container(
                                      margin:
                                          const EdgeInsets.only(right: 25.0),
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      // 녹음 화면으로 이동하는 버튼
                                      child: IconButton(
                                        icon: const Icon(Icons.folder,
                                            color: Colors.white),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangeNotifierProvider<
                                                      RecordViewModel>(
                                                create: (_) => RecordViewModel(
                                                  viewModel.allFileList,
                                                ),
                                                child: RecordView(),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
