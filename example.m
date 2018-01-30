function example()
%%
% This is an example code for running the algorithm for sea edge detector
% and segmentation from [1,2]. The code loads the learned hiperpriors for
% the MOD dataset. If you would like to use it with another dataset, the
% hiperpriors will have to be re-learned. 
%
% The code requires downloading and setting the path to the MOD dataset.
% The dataset is available from the http://www.vicos.si/People/Matejk .
% 
% [1] Fast image-based obstacle detection from unmanned surface vehicles
% Matej Kristan, Vildana Sulic, Stanislav Kovacic, and Janez Per�
% ViCoS technical report 201430 -- draft of a paper under review, 2014
% 
% [2] A graphical model for rapid obstacle image-map estimation from unmanned surface vehicles
% Matej Kristan, Janez Per�, Vildana Sulic, and Stanislav Kovacic
% Asian Conference on Computer Vision, ACCV2014, 2014
% Written by: Rok Mandeljc, Matej Kristan (2014)

%% Set paths
% path to the selected video in the MOD dataset
%path_to_modd = 'c:/datasets/modd/' ;
%path_modd_video = [path_to_modd,'0001.avi'] ; 

%% Add paths to learned models and draw tools
Addpaths() ;

%% Load video
%{
if ~exist('frames', 'var'),                                         %如果frames变量已经存在则返回1
    fprintf('Reading video ...') ;
    vid = VideoReader('./0000.mp4');
    num_frames = vid.NumberOfFrames;
    frames = vid.read([ 1 num_frames ]);
    clear vid;
    fprintf('done! \n')
end
%}
%% Prepare
detector = DetectorState;

%% specify display type
display_type = 2; % Can choose between two types of visualization by setting to 1 or 2.
 
%% Process
%for f = 1:num_frames,
    % Get frame
%    I = frames(:,:,:,f);
%    I = imread('../testData/bigTarget/scaleBigship0372.jpg');
%    I = imread('../testData/modd_dataset1.0/01data00056.jpg');
   I = imread('../testData/coastline/sacleStaticShip0001.jpg');
%     I = imread('./59494115.jpg');
    % Process frame
    [ detector, sel_xy, objects, masked_sea] = detect_edge_of_sea_simplified(detector, I) ;
    
    % Display results
    displayEdgeAndObjects( I, sel_xy, objects, masked_sea, detector.current_mixture, display_type ) ;
end