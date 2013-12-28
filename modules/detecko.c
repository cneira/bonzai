/*
	 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <cneirabustos@gmail.com> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return, carlos neira bustos 
 * ----------------------------------------------------------------------------
 */

#include <sys/queue.h>
#include <sys/param.h>
#include <sys/linker.h>
#include </usr/src/sys/dev/pci/pcireg.h>
#include <sys/types.h>
#include <sys/pciio.h>
#define	_PATH_DEVPCI	"/dev/pci"

/* Prototipes */
static void look_for_soundcard();

/* end proto*/

static void look_for_soundcard()
{
	int fd;
	struct pci_conf_io pc;
	struct pci_conf conf[255], *p;

	fd = open(_PATH_DEVPCI, O_RDONLY, 0);

	if (fd < 0)
		err(1, "%s", _PATH_DEVPCI);

	bzero(&pc, sizeof(struct pci_conf_io));
	pc.match_buf_len = sizeof(conf);
	pc.matches = conf;

	do {
		if (ioctl(fd, PCIOCGETCONF, &pc) == -1)
			uprintf("ioctl(PCIOCGETCONF)");

		if (pc.status == PCI_GETCONF_LIST_CHANGED) {
			warnx("PCI device list changed, please try again");
			close(fd);
			return;
		} else if (pc.status ==  PCI_GETCONF_ERROR) {
			warnx("error returned from PCIOCGETCONF ioctl");
			close(fd);
			return;
		}
		for (p = conf; p < &conf[pc.num_matches]; p++) {
			  printf("vendor %x |device %x|\n",p->pc_vendor,p->pc_device);
		}
	} while (pc.status == PCI_GETCONF_MORE_DEVS);

	close(fd);
}


