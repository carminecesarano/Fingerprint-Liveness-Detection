# Fingerprint Liveness Detection
We first extract features from fingerprint images and then develop machine learning models such as neural networks and SVM for classification of real and fake fingerprints. In all approaches, information in the training set on the 'subject' owner of the fingerprint has been eliminated. The feature extraction methods that we used were WLD, LPQ or some neural networks.
We were able to achieve, with the best approach, test accuracy ranging from 98% to 99%.

# Data set
We use the fingerprint images data set from "Liveness Detection Competitions 2015"  [Available Here](http://livdet.org/registration.php).

# Method 1
The features have been extracted with an approach called LCPD obtained from the concatenation of a spatial component based on the WLD descriptor, and a phase component obtained from a version of the LPQ descriptor [Reference here](https://www.researchgate.net/publication/265164108_Local_contrast_phase_descriptor_for_fingerprint_liveness_detection).
In order to reduce the complexity and to prevent overfitting, PCA was applied to maintain 95% variance. The SVM model is then calibrated and applied.
The results are not satisfactory (about 50% accuracy)

# Method 2
In order to have a larger training set, we also introduced new training data by augmenting available training images. Five square patches are extracted from the original train image.
<div align="center">
<img src="img/Immagine1.png" width="100px">
</div>
<br />
The features extraction phase is operated through deep approach, using a VGG19 network pre-added on the dataset 'Imagenet'. The successive phases don't differ from the 'Method 1', therefore an SVM is still used for the classification phase. However, this does not yet allow an improvement in accuracy.

# Method 3
This attempt concerns a completely deep approach. A neural network is used for both the features extraction phase and the classification phase. In particular, a resnet50 is used, and during the tuning the following optimal parameters are found:
- Epoch: 8
- Batch size: 16
- Learning rate: 0.0005 (costant)
- L2 Regularization: 0.0001
This approach results in 95% accuracy

# Method 4
To further improve performance, with the last attempt a learining rate scheduling is used with the following optimal parameters:
- Initial learning rate: 0.0005
- Drop factor: 0.7
- Drop period : 3
This last change allows to stabilize the learning with the epochs increasing and allows to gain some percentage point on the accuracy of the model, that reaches to 99,16%.
