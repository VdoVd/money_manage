import { data, timeClass } from './data'

@CustomDialog
export default struct timeDialog{

  controller:CustomDialogController
  @State selectedTime:Date=new Date()
  @State selectYear:number=0
  @State data:timeClass={} as timeClass

  aboutToAppear(): void {

    this.data=data()

  }

  build() {
    Column(){
Row(){
  TextPicker({range:this.data.year})
    .onChange((value:string|string[],index:number[]|number)=>{

    })

  TextPicker({range:this.data.mouth})
    .onChange((value:string|string[],index:number[]|number)=>{

    })
}


    }
  }

}