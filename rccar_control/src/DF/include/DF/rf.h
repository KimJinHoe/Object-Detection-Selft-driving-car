#ifndef __RF__
#define __RF__

#include <iostream>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>
#include <cstdio>
#include <unistd.h>
#include <linux/joystick.h>
#include <thread>


//Axis : -32767 ~ 32767

struct axis_state
{
    short x, y;
};


class rf
{
	public:
		rf();
		~rf();
		int get_axis(int num, bool ax); // 0 : x, 1 : y
		bool get_button(int num);
	private:
		void m_run();

		int read_event(int fd, struct js_event *event);
		size_t get_axis_count(int fd);
		size_t get_button_count(int fd);
		size_t get_axis_state(struct js_event *event, struct axis_state axes[3]);
		
		char *device_path;
		int js;
		struct js_event event;
		struct axis_state axes[3];
		
		size_t axis;
		struct axis_state axes_output[3];
		bool but_output[11];
};

#endif
