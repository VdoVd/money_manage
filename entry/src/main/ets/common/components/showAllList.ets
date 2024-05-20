import { showAllRole } from '../../view/role/roleView'
import actionView from './actionView'
import commonRow from './commonRow'
import showAllItem from './showAllItem'

@Component
export default struct showAllList{
  @Provide dataModel:Object[]=[]
  build() {
    Column({space:15}){
    List(){
      ForEach(this.dataModel,(item:Object,index:number)=>{
        ListItem(){
          Column(){
            commonRow({title:'编号',val:`${index+1}`})
            showAllItem({index:index,item:item})
            actionView()
          }
        }
        .margin({bottom:15})
      })
    }.height('100%').width('100%')
    }.width('100%').height('100%')
  }
}