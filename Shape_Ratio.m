% Defining an Objekt in Scene with width and depth
x0 = 200;  %x-coord of object in mm
z0 = 300;  %z-coord of object in mm
W0 = 300;  % x0b - x0a distance between two edges a and b of the object in mm

% Values are picked out of S3DKalkulator
f = 36; % Focallength in mm
t = 136; % Stereobase in mm (distance of image sensors)
Ws = 4040; % in mm --> viewing screen width
e = 55; % Distance between eyes
V = 4100; % Distance between eyes and screen

% Compute h with given Valus --> Hit Prewiev is given in Pixel
HIT = 37; % in Pixel
Wc = 22.3; % in mm --> Image sensor Width
xres = 1920; % Resolution --> Other possible Values are 720, 1280, 2048, 4096
h= (HIT * Wc)/ xres; % Get h shift out of HIT_Pixel (derived after h)

M = Ws/Wc; % screen magnification factor --> for transformation from sensor to screen coordinates

% Compute imaged object onto the right/left camera image sensors (xcr and xcl)
xcr = -f*((t-2*x0)/(2*z0))+h; 
xcl = f*((t-2*x0)/(2*z0))+h; % seems to be wrong --> value is too big

%Compute xi and zi as perceived by the viewer
xi = (M*e*f*x0)/ (M*f*t - z0*(2*M*h-e));
zi = (V*e*z0)/(M*f*t-z0*(2*M*h-e));

%Compute Width Magnification --> first part for computing Shape Ratio
Wi3D = (M*e*f*W0)/(M*f*t-z0*(2*M*h-e));
Mi3D = Wi3D/W0; % Width Magnification;
%Mi3D = (M*e*f)/(M*f*t-z0*(2*M*h-e));

%Compute Depth Magnification 
MD = (M*V*e*f*t)/(M*f*t-z0*(2*M*h-e)).^2;

%Compute Shape Ratio
S = (MD/Mi3D);

