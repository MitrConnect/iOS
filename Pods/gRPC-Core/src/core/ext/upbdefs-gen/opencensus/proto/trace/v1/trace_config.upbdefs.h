/* This file was generated by upb_generator from the input file:
 *
 *     opencensus/proto/trace/v1/trace_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated.
 * NO CHECKED-IN PROTOBUF GENCODE */

#ifndef OPENCENSUS_PROTO_TRACE_V1_TRACE_CONFIG_PROTO_UPB_H__UPBDEFS_H_
#define OPENCENSUS_PROTO_TRACE_V1_TRACE_CONFIG_PROTO_UPB_H__UPBDEFS_H_

#include "upb/reflection/def.h"
#include "upb/reflection/internal/def_pool.h"

#include "upb/port/def.inc" // Must be last.
#ifdef __cplusplus
extern "C" {
#endif

extern _upb_DefPool_Init opencensus_proto_trace_v1_trace_config_proto_upbdefinit;

UPB_INLINE const upb_MessageDef *opencensus_proto_trace_v1_TraceConfig_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &opencensus_proto_trace_v1_trace_config_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "opencensus.proto.trace.v1.TraceConfig");
}

UPB_INLINE const upb_MessageDef *opencensus_proto_trace_v1_ProbabilitySampler_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &opencensus_proto_trace_v1_trace_config_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "opencensus.proto.trace.v1.ProbabilitySampler");
}

UPB_INLINE const upb_MessageDef *opencensus_proto_trace_v1_ConstantSampler_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &opencensus_proto_trace_v1_trace_config_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "opencensus.proto.trace.v1.ConstantSampler");
}

UPB_INLINE const upb_MessageDef *opencensus_proto_trace_v1_RateLimitingSampler_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &opencensus_proto_trace_v1_trace_config_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "opencensus.proto.trace.v1.RateLimitingSampler");
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* OPENCENSUS_PROTO_TRACE_V1_TRACE_CONFIG_PROTO_UPB_H__UPBDEFS_H_ */
