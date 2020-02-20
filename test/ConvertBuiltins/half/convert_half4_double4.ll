
; RUN: clspv-opt -ReplaceOpenCLBuiltin %s -o %t.ll
; RUN: FileCheck %s < %t.ll

target datalayout = "e-p:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir-unknown-unknown"

; CHECK: [[conv:%[a-zA-Z0-9_.]+]] = fptrunc <4 x double> %x to <4 x half>
; CHECK: ret <4 x half> [[conv]]

define <4 x half>@foo(<4 x double> %x) {
entry:
  %call = call <4 x half> @_Z13convert_half4Dv4_Dh(<4 x double> %x)
  ret <4 x half> %call
}

declare <4 x half> @_Z13convert_half4Dv4_Dh(<4 x double>)