#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_utils"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ruud/youBot/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ruud/youBot/install/lib/python2.7/dist-packages:/home/ruud/youBot/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ruud/youBot/build" \
    "/usr/bin/python" \
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_utils/setup.py" \
    build --build-base "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_utils" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/ruud/youBot/install" --install-scripts="/home/ruud/youBot/install/bin"
