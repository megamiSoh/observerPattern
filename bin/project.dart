void main() {
  var first = First('1번 ');
  var second = Second('2번 ');
  var third = Third('3번 ');
  var add = Result();
  add.addObserver(first);
  add.addObserver(second);
  add.addObserver(third);
  add.result();
  add.removeObserver(first);
  add.result();
}


// 단순하게 옵저버 디자인이 어떤 개념인지 단순하게 이해하는것은 어렵지 않았지만,
// 객체간에 상호 의존성을 최소화 해야 하는 부분(서브젝트와 옵저버는 독립적으로 재사용할 수 있음)등을 
// 염두에 두고 코딩하는 것이 생각보다 쉽지 않았다.

// 푸시방식

// 한 객체의 상태가 바뀌면 그 객체에 의존하는 다른 객체들한테 연락이 가고 자동으로 내용이 갱신되는 방식으로, 일대다 의존성을 정의한다.
//상태를 저장하고 있는 주제 객체와 주제객체에 의존하고 있는 여러개의 옵저버 객체가 있는 디자인을 바탕으로 한다.



//observer : 상태를 업데이트

class Observer {
  final String _isWho;
  Observer(this._isWho);
  void notify(String msg) {
    print(_isWho + msg);
    
  }
}

//숫자 클래스 : 각각의 상태를 정의

class First extends Observer{
  String msg;
  First(String msg) : super(msg);
}

class Second extends Observer{
  String msg;
  Second(String msg) : super(msg);
}

class Third extends Observer{
  String msg;
  Third(String msg) : super(msg);
}

//subject : 옵저버의 추가, 삭제, 공지 기능을 가지는 메소드를 선언

class Subject {
  List<Observer> _list;
  Subject([List<Observer> list]){
    _list = list ?? [];
  }

  void addObserver(Observer item) {
    _list.add(item);
  }
  void removeObserver(Observer item) {
    _list.remove(item);
  }
  void notifyObserver(String msg) {
    for(var observer in _list) {
      observer.notify(msg);
    }
  }
}

//Result : Subject를 상속받아 옵저버들 업데이트 및 관리

class Result extends Subject {
   Result([List<Observer> observers]) : super(observers);
  void result() {
    notifyObserver('구독 완료');
  }
}