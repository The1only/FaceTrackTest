#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <opencv4/opencv2/opencv.hpp>
#include "targetdetector.h"

#include <iostream>

using namespace std;
using namespace cv;

MainWindow::MainWindow(QWidget *parent, int argc, char *argv[])
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    cv::Mat frame;
    ui->setupUi(this);

    cv::VideoCapture video_capture;
   if (!video_capture.open(0)) {
       exit(-1);
   }

   TargetDetector face_detector;

   while (true) {
       video_capture >> frame;

       auto rectangles = face_detector.detect_target_rectangles(frame);
       cv::Scalar color(0, 105, 205);
       for(const auto & r : rectangles){
           cv::rectangle(frame, r, color, 4);
       }

       imshow("Image", frame);
       int esc_key = 27;
       if (cv::waitKey(10) == esc_key) {
           break;
       }
   }

   cv::destroyAllWindows();
   video_capture.release();
   exit(0);
}

MainWindow::~MainWindow()
{
    delete ui;
}

