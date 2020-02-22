////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020 Bluespec, Inc. All rights reserved.
//
// SPDX-License-Identifier: BSD-3-Clause
//
////////////////////////////////////////////////////////////////////////////////
//  Filename      : AhbToAhbBridge.bsv
//  Description   :
////////////////////////////////////////////////////////////////////////////////
package AhbToAhbBridge;

// Notes :

////////////////////////////////////////////////////////////////////////////////
/// Imports
////////////////////////////////////////////////////////////////////////////////
import AhbDefines        ::*;
import AhbSlave          ::*;
import AhbMaster         ::*;
import TLM3              ::*;
import DefaultValue      ::*;
import Connectable       ::*;

`include "TLM.defines"

////////////////////////////////////////////////////////////////////////////////
/// Interfaces
////////////////////////////////////////////////////////////////////////////////
interface AhbToAhbBridge#(`TLM_XTR_DCL);
   interface AhbXtorSlaveWM#(`TLM_PRM) slave;
   interface AhbXtorMaster#(`TLM_PRM)  master;
endinterface

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///
/// Implementation
///
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
module mkAhbToAhbBridgeWM#(function Bool addr_match(AhbAddr#(`TLM_PRM) addr))(AhbToAhbBridge#(`TLM_XTR))
   provisos ( Bits#(req_t, s0)
            , Bits#(resp_t, s1)
	    , DefaultValue#(TLMResponse#(`TLM_PRM))
	    , DefaultValue#(RequestDescriptor#(`TLM_PRM))
	    , TLMRequestTC#(req_t, `TLM_PRM)
	    , TLMResponseTC#(resp_t, `TLM_PRM)
	    );

   ////////////////////////////////////////////////////////////////////////////////
   /// Design Elements
   ////////////////////////////////////////////////////////////////////////////////
   AhbSlaveXActorWM#(`TLM_XTR)               ahb_slave           <- mkAhbSlaveWM( addr_match );
   AhbMasterXActor#(`TLM_XTR)                ahb_master          <- mkAhbMaster(10);

   ////////////////////////////////////////////////////////////////////////////////
   /// Submodule Connections
   ////////////////////////////////////////////////////////////////////////////////
   mkConnection(ahb_slave.tlm, ahb_master.tlm);

   ////////////////////////////////////////////////////////////////////////////////
   /// Interface Connections / Methods
   ////////////////////////////////////////////////////////////////////////////////
   interface slave  = ahb_slave.fabric;
   interface master = ahb_master.fabric;

endmodule

endpackage: AhbToAhbBridge

