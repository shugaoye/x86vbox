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

#include <stdlib.h>
#include <string.h>

#include "edify/expr.h"

Value* ReprogramX86vboxFn(const char* name, State* state, int argc, Expr* argv[]) {
  int successful = 0;

  if (argc != 2) {
    return ErrorAbort(state, "%s() expects 2 args, got %d", name, argc);
  }

  Value* key;
  Value* image;
  if (ReadValueArgs(state, argv, 2, &key, &image) != 0) {
    return NULL;   // ReadValueArgs() will have set the error message
  }

  if (key->type != VAL_STRING || image->type != VAL_BLOB) {
    ErrorAbort(state, "arguments to %s() have wrong type", name);
    FreeValue(key);
    FreeValue(image);
    return NULL;
  }

  FreeValue(key);
  FreeValue(image);

  return StringValue(strdup(successful ? "t" : ""));
}

void Register_librecovery_updater_x86vbox() {
  RegisterFunction("x86vbox.reprogram", ReprogramX86vboxFn);
}
