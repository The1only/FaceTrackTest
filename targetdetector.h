#ifndef VISUALS_H
#define VISUALS_H
#include <opencv4/opencv2/dnn.hpp>

class TargetDetector {
public:
    explicit TargetDetector();
    std::vector<cv::Rect> detect_target_rectangles(const cv::Mat &frame);

private:
    cv::dnn::Net network_;
    const int input_image_width_;
    const int input_image_height_;
    const double scale_factor_;
    const cv::Scalar mean_values_;
    const float confidence_threshold_;
};

#endif //VISUALS_H
