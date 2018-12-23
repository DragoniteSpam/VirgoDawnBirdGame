//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
uniform float time;    // The current time.


// Define the position of the light.
vec3 lightPos()
{
  return vec3(-1.0, 1.0, -1.0);
}

// Calculate how much to illuminate a point, based on how much light it can see.
void applyLighting(vec3 rayPos, vec3 rayDir, inout vec4 rgb)
{
  vec3 v1 = normalize(rayDir);
  vec3 v2 = normalize(lightPos() - rayPos);
  
  // Get the angle between the reflected ray and the light.
  float angle = acos(dot(v1, v2));
  
  // Apply illumination. (Small angle gives high illumination.)
  float illum = 1.0 - angle / 3.141;
  rgb.rgb *= illum;
}

// Calculate whether a ray hits a sphere.
// If it hits, return the distance to the object.
float sphereHit(inout vec3 rayPos, inout vec3 rayDir, vec3 origin, float radius, inout vec4 rgb)
{
  vec3 p = rayPos - origin;

  // We need to solve a quadratic to find the distance.  
  float a = dot(rayDir, rayDir);
  float b = 2.0 * dot(p, rayDir);
  float c = dot(p, p) - (radius * radius);
  
  if (a == 0.0)
    return 999.0; // No hit.
  
  float f = b * b - 4.0 * a * c;
  if (f < 0.0)
    return 999.0;
  
  float lamda1 = (-b + sqrt(f)) / (2.0 * a);
  float lamda2 = (-b - sqrt(f)) / (2.0 * a);
  
  if (max(lamda1, lamda2) <= 0.0)
    return 999.0;
  
  // Find nearest hit point.
  if (lamda1 <= 0.0)
    lamda1 = lamda2;
  else if (lamda2 <= 0.0)
    lamda2 = lamda1;
  
  float dist = min(lamda1, lamda2);
  
  // Reflect ray off the surface.
  rayPos = rayPos + dist * rayDir;
  vec3 normal = normalize(rayPos - origin);
  rayDir = reflect(rayDir, normal);
  
  return dist;
}

// Calculate whether a ray hits the floor plane.
// If it hits, return the distance to the object.
float planeHit(inout vec3 rayPos, inout vec3 rayDir, float y, inout vec4 rgb)
{
  if (rayDir.y == 0.0)
    return 999.0; // Ray is parallel to the plane.
  
  float lamda = (y - rayPos.y) / rayDir.y;
  float dist = lamda * length(rayDir);
  
  // Reflect ray off the surface.
  rayPos = rayPos + dist * normalize(rayDir);
  rayDir = reflect(rayDir, vec3(0.0, 1.0, 0.0));
  
  // Use 'mod' to determine whether the floor tile is black or white.
  float a = mod(rayPos.x, 1.0) - 0.5;
  float b = mod(rayPos.z, 1.0) - 0.5;
  if (sign(a) == sign(b))
    rgb = vec4(0.0, 0.0, 0.0, 1.0);
  
  return dist;
}

// Check for a collision between ray and object.
// If there is one, return the distance to the object.
float objectHit(int id, inout vec3 rayPos, inout vec3 rayDir, inout vec4 rgb)
{
  if (id == 0)
  {
    // Object 0 - Red sphere.
    rgb = vec4(1.0, 0.0, 0.0, 1.0);
    return sphereHit(rayPos, rayDir, vec3(-0.3, -0.2, 0.0), 0.5, rgb);
  }
  
  if (id == 1)
  {
    // Object 1 - Yellow sphere.
    rgb = vec4(1.0, 1.0, 0.0, 1.0);
    return sphereHit(rayPos, rayDir, vec3(0.3, sin(time)* 0.6 + 0.3, -0.2), 0.3, rgb);
  }
  
  // Object 2 - The floor.
  rgb = vec4(1.0);
  return planeHit(rayPos, rayDir, -0.5, rgb);
}

// Cast a ray to simply see if it hits any object in the scene.
bool rayIsBlocked(inout vec3 inRayPos, inout vec3 inRayDir)
{
  for (int id = 0; id < 3; id++)
  {
    vec4 rgb = vec4(0.0);
    float d = objectHit(id, inRayPos, inRayDir, rgb);
    if (d > 0.0 && d < 999.0)
      return true;
  }
  
  return false;
}

// The bulk of the raytrace work is done here.
// Cast a ray through the scene and see if it hits an object.
vec4 castRay(inout vec3 inRayPos, inout vec3 inRayDir)
{
  vec4 rgb = vec4(0.0);    // Default color.
  float d_nearest = 999.0; // Distance to the nearest hit object.

  vec4 hit_rgb;
  vec3 bouncedRayPos, bouncedRayDir;
  vec3 testRayPos, testRayDir;
  
  // Check for a collision with each of the objects in the scene.
  for (int id = 0; id < 3; id++)
  {
    testRayPos = vec3(inRayPos); testRayDir = vec3(inRayDir);
    float d = objectHit(id, testRayPos, testRayDir, hit_rgb);
    
    // If there was a hit, and it occurred nearer than any other object...
    if (d > 0.0 && d < d_nearest)
    {
      // ...remember it.
      d_nearest = d;
      rgb = hit_rgb;
      bouncedRayPos = vec3(testRayPos); bouncedRayDir = vec3(testRayDir);
    }
  }

  // If we hit something...
  if (d_nearest > 0.0 && d_nearest < 999.0)
  {
    inRayPos = bouncedRayPos;
    inRayDir = bouncedRayDir;

    // Advance the ray by a small amount.
    vec3 pos = bouncedRayPos + bouncedRayDir / 1000.0;
    
    // Calculate the vector connecting the hit point to the light.
    vec3 dir = lightPos() - bouncedRayDir;
    if (rayIsBlocked(pos, dir))
    {
      // An object is blocking the light source - We're in shadow.
      rgb.rgb = vec3(0.0);
    }
    else
    {
      // The point can see the light - Calculate how much it can see.
      applyLighting(bouncedRayPos, bouncedRayDir, rgb);
    }
  }
  
  return rgb;
}

// Generate a matrix which will allow a vector to be rotated around the Y axis.
mat4 rotationMatrix(vec3 axis, float angle)
{
    float s = sin(angle);
    float c = cos(angle);
    return mat4(c, 0.0, s, 0.0, 0.0, 1.0, 0.0, 0.0, -s, 0.0, c, 0.0, 0.0, 0.0, 0.0, 1.0);
}

// The entry point to the shader.
void main() {
  // Set the camera properties.
  float cameraSpeed = 0.2;
  float cameraAngle = time * cameraSpeed;
  float cameraDist = 2.0;
  
  // Define the position and directions of the 'ray' to fire.
  vec3 rayPos = vec3(v_vTexcoord.x - 0.5, 0.5 - v_vTexcoord.y, -cameraDist);
  vec3 rayDir = normalize(vec3(v_vTexcoord.x - 0.5, 0.5 - v_vTexcoord.y, 1.0));
  
  rayPos = vec3(rotationMatrix(vec3(0.0, 1.0, 0.0), cameraAngle) * vec4(rayPos, 0.0));
  rayDir = vec3(rotationMatrix(vec3(0.0, 1.0, 0.0), cameraAngle) * vec4(rayDir, 0.0));
  
  // Fire the ray into the scene.
  vec4 rgb = castRay(rayPos, rayDir);
  if (rgb.a > 0.0)
  {
    // The ray hit an object!
    
    // Advance the ray by a small amount.
    rayPos += rayDir / 1000.0;
    
    // Cast the reflected ray, and combine the results with the original RGB.
    float shine = 0.2;
    vec4 rgb_bounce = castRay(rayPos, rayDir);
    rgb = rgb * (1.0 - shine) + rgb_bounce * shine;
  }
  else
  {
    // The ray missed all objects - Plot a black pixel.
    rgb = vec4(0.0, 0.0, 0.0, 1.0);
  }
  
  gl_FragColor = rgb;
}

