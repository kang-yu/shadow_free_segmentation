%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Train an SVM classifier for recognizing shadow boundaries. This file runs
% a series of commands that extract the necessary features from a labelled
% shadow boundary dataset, select the features used for training and train 
% a classifier. Features and classifier models are saved to disk for future
% use.
% NOTE: boundary extraction and feature extraction steps generate an
% overcomplete set of features. The classifier training step only uses a
% subset of these features. You can rerun the training step with different
% settings to generate classfiers using different features.
%
% ----------------
% Aleksandrs Ecins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Add paths

% Mycode
addpath(genpath('../../../utilities/'));                                    % Utility functions
addpath('./feature_extraction/');                                           % Feature extraction functions
addpath('../density_map/');                                              % Density map

% 3rd party
addpath('../../3rd_party/lbp/');                                         % Local Binary Patterns
otherCodeDirPath = '../../../../';                                          % Directory containing the rest of the 3rd party code
addpath(fullfile(otherCodeDirPath, 'segbench/lib/matlab/'));                % Berkeley edges and filterbank
addpath(fullfile(otherCodeDirPath, 'libsvm/matlab/'));                      % LIBSVM

%% Clear and close
close all
clearAllPreserveBreakpoints;

%% Train

% Extract boundaries from labels
fprintf('\n---- Extracting boundaries from labelled data ----\n\n');
extract_boundaries_from_labels;

% Extract features for each boundary
fprintf('\n---- Feature extraction ----\n\n');
feature_extraction;

% Train the classifier
fprintf('\n---- Training a classifier ----\n\n');
classifier_train;