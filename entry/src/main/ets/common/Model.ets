import { ExpectExtend } from '@ohos/hypium'
import { IntentionCode } from '@kit.InputKit'

export interface allResponse<T>{
  code:number
  message:string
  data:T
  success:boolean
}

