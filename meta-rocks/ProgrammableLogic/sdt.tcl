# Copyright (C) 2026 ETH Zurich
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the GPL-3.0 license.  See the LICENSE file for details.

set outdir [lindex $argv 1]
set xsa [lindex $argv 0]
exec rm -rf $outdir
set_dt_param -xsa $xsa -dir $outdir -board_dts zynqmp-smk-k26-reva
generate_sdt
