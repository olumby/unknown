#define scaleFix(value) (value * 0.75)
#define edgeOffsetY 0.02
#define edgeOffsetX scaleFix(0.02)
// Center an object relative to its container
#define CENTER(CONTAINER_S, OBJ_S) ((CONTAINER_S / 2) - (OBJ_S / 2))
