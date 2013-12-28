/***********************************************************************
*                                                                      *
* This software is part of the mon tools package                       *
* Copyright (c) 2008-2013  Bonzai BSD Intellectual Property              *
* and is licensed under the                                            *
* Common Public License, Version 1.6                                   *
* by Bonzai Intellectual Property                                        *
*                                                                      *
* A copy of the License is available at                                *
* http://www.opensource.org/licenses/cpl1.0.txt                        *
*                                                                      *
*  cneirabustos@gmail.com                                              *
*                                                                      *
***********************************************************************/


#include "sound_detect.h"

 char*  searchpci()
{
  int fd;
  struct pci_conf_io pc;
  struct pci_conf conf[255], *p;
  static char onek[1024];
  unsigned int i=0;
  char plist[64];

  fd = open(_PATH_DEVPCI, O_RDONLY, 0);

  if (fd < 0)
    err(1, "%s", _PATH_DEVPCI);

  bzero(&pc, sizeof(struct pci_conf_io));
  pc.match_buf_len = sizeof(conf);
  pc.matches = conf;

  do {
    if (ioctl(fd, PCIOCGETCONF, &pc) == -1)
      err(1, "ioctl(PCIOCGETCONF)");

    if (pc.status == PCI_GETCONF_LIST_CHANGED) {
      warnx("PCI device list changed, please try again");
      close(fd);
      return "PCI device list changed, please try again";
    } else if (pc.status ==  PCI_GETCONF_ERROR) {
      warnx("error returned from PCIOCGETCONF ioctl");
      close(fd);
      return "PCI device list changed, please try again";
    }
         
    for (p = conf; p < &conf[pc.num_matches]; p++) 
      {
	sprintf(plist,"(:pci%d (:class %x :vendor %x :device %x)) ",
		i,
		PCI_CLASS,
                p->pc_vendor,
		p->pc_device);
	strcat(onek,plist);
#ifdef _DEBUG
	printf("%s\n",plist);
#endif
	i++;
      }
  } while (pc.status == PCI_GETCONF_MORE_DEVS);
  close(fd);
  return onek;
}


