/***********************************************************************
*                                                                      *
* This software is part of the mon tools package                       *
* Copyright (c) 2008-2013  NeXT BSD Intellectual Property              *
* and is licensed under the                                            *
* Common Public License, Version 1.6                                   *
* by NeXT Intellectual Property                                        *
*                                                                      *
* A copy of the License is available at                                *
* http://www.opensource.org/licenses/cpl1.0.txt                        *
*                                                                      *
*  cneirabustos@gmail.com                                              *
*                                                                      *
***********************************************************************/
#ifndef SOUND_DETECT_H__
#define SOUND_DETECT_H__
#include <sys/types.h>
#include <sys/fcntl.h>
#include <err.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <libutil.h>
#include <sys/pciio.h>
#include <sys/queue.h>
#include <sys/param.h>
#include <sys/linker.h>
#include </usr/src/sys/dev/pci/pcireg.h>

#define	_PATH_DEVPCI	"/dev/pci"
#define  PCI_CLASS ((p->pc_class << 16) | (p->pc_subclass << 8) |( p->pc_progif))

char* searchpci();
#endif
