/******************************************************************************
 *
 * recovery_x86vbox.cpp - Extend recovery for x86vbox
 *
 * Copyright (c) 2017 Roger Ye.  All rights reserved.
 * Software License Agreement
 *
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
 * NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
 * NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. The AUTHOR SHALL NOT, UNDER
 * ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
 * DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 *****************************************************************************/

#include <linux/input.h>

#include "common.h"
#include "device.h"
#include "device.h"
#include "screen_ui.h"

class X86vboxUI : public ScreenRecoveryUI {
  public:
    virtual KeyAction CheckKey(int key) {
      if (key == KEY_HOME) {
        return TOGGLE;
      }
      return ENQUEUE;
    }
};

class X86vboxDevice : public Device {
  private:
	X86vboxUI* ui_;

  public:
    X86vboxDevice(X86vboxUI* ui) : Device(ui), ui_(ui)  { }

    X86vboxUI* GetUI() { return ui_; }
};

Device* make_device() {
  /* return (Device*)new X86vboxDevice(new X86vboxUI); */
  return new X86vboxDevice(new X86vboxUI);
}
