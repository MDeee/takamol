class CardsHelper {
  static final List<List<Map<String, CardChoiceDetails>>> sbCards = [
    //SP1.1
    [
      //SP1.1 #1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 5,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 25,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: 0,
        ),
      },
      //done
      //////////
      //SP1.1 #2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 40,
          egressTime: 0,
          totalCost: 0,
        ),
      },
      // done
      //////////
      //SP1.1 #3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.25,
          waitingTime: 5,
          egressTime: 0.0,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP1.1 #4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: 0.0,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP1.1 #5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 20,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 30,
          egressTime: -0.25,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      //SP1.1 #6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.25,
          totalCost: 0.0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 25,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: 0.0,
        ),
        //done
      }
    ],
    //done////////////

    //SP1.2
    [
      //SP1.2 #1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.25,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 20,
          egressTime: 0.0,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP1.2 #2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.0,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 25,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      //SP1.2 #3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0.0,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 20,
          egressTime: 0.125,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 25,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: 0.0,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP1.2 #4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: -0.125,
          totalCost: 0.0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.25,
          waitingTime: 10,
          egressTime: 0.0,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP1.2 #5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 30,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP1.2 #6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 5,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 40,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
      }
      //done
      ///////
    ],
    //done
    //SP2.1
    [
      //SP2.1 #1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 5,
          egressTime: -0.25,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 25,
          egressTime: 0.125,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP2.1 #2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 5,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 40,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
      },
      // done
      //////////
      //SP2.1 #3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 5,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP2.1 #4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.25,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 10,
          egressTime: 0,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP2.1 #5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: 0.25,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 5,
          egressTime: 0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 25,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 30,
          egressTime: -0.125,
          totalCost: 0,
        ),
      },
      //done
      //////////
      //SP2.1 #6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 20,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 30,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        //done
      }
    ],
    //done////////////
    //SP2.2
    [
      //SP2.2 #7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 5,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 40,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP2.2 #8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0.125,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 20,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
      },
      // done
      //////////
      //SP2.2 #9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 20,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 25,
          egressTime: -0.25,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 40,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP2.2 #10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.25,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 25,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 30,
          egressTime: 0,
          totalCost: 0,
        ),
      },
      //done
      //////////
      //SP2.2 #11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 5,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 40,
          egressTime: -0.125,
          totalCost: 0,
        ),
      },
      //done
      //////////
      //SP2.2 #12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: -0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 5,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 25,
          egressTime: 0,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 40,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        //done
      }
    ],
    //done////////////
    //SP3.1
    [
      //SP3.1 #1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0.25,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 25,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 40,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP3.1 #2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 20,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 25,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 40,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
      },
      // done
      //////////
      //SP3.1 #3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: -0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 20,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP3.1 #4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP3.1 #5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: 0.25,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 20,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 40,
          egressTime: 0,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP3.1 #6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 20,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 15,
          egressTime: 0,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 30,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        //done
      }
    ],
    //done////////////
    //SP3.2
    [
      //SP3.2 #7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0.25,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 20,
          egressTime: -0.25,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 30,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP3.2 #8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 20,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 15,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 30,
          egressTime: 0,
          totalCost: -0.125,
        ),
      },
      // done
      //////////
      //SP3.2 #9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: -0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 20,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 30,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP3.2 #10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: 0,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 5,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: 0,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 30,
          egressTime: 0,
          totalCost: 0,
        ),
      },
      //done
      //////////
      //SP3.2 #11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP3.2 #12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 5,
          egressTime: 0.125,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 25,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 30,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
        //done
      }
    ],
    //done////////////
    //SP4.1
    [
      //SP4.1 #1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0.25,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 5,
          egressTime: 0,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 30,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP4.1 #2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: -0.125,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 30,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
      },
      // done
      //////////
      //SP4.1 #3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: -0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 20,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: -0.25,
          totalCost: 0,
        ),
      },
      //done
      //////////
      //SP4.1 #4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: 0,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 5,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 15,
          egressTime: 0,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 40,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP4.1 #5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.25,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 20,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 25,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 40,
          egressTime: 0,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP4.1 #6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.25,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: 0,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 15,
          egressTime: 0,
          totalCost: 0,
        ),
        //done
      }
    ],
    //done////////////
    //SP4.2
    [
      //SP4.2 #7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0.125,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: 0.125,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 25,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 30,
          egressTime: 0,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP4.2 #8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0.25,
          totalCost: 0.25,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: 0,
          totalCost: -0.25,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 30,
          egressTime: 0,
          totalCost: 0.125,
        ),
      },
      // done
      //////////
      //SP4.2 #9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.125,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 25,
          egressTime: -0.25,
          totalCost: 0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0,
          waitingTime: 15,
          egressTime: 0,
          totalCost: 0.125,
        ),
      },
      //done
      //////////
      //SP4.2 #10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.125,
          egressTime: 0,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 5,
          egressTime: -0.25,
          totalCost: -0.25,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 25,
          egressTime: -0.25,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 15,
          egressTime: 0.125,
          totalCost: -0.25,
        ),
      },
      //done
      //////////
      //SP4.2 #11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.25,
          egressTime: 0,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 5,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.25,
          totalCost: 0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 40,
          egressTime: 0.125,
          totalCost: -0.125,
        ),
      },
      //done
      //////////
      //SP4.2 #12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0,
          egressTime: -0.125,
          totalCost: 0,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.125,
          waitingTime: 10,
          egressTime: -0.125,
          totalCost: -0.125,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.125,
          waitingTime: 10,
          egressTime: 0,
          totalCost: -0.125,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.25,
          waitingTime: 30,
          egressTime: -0.25,
          totalCost: 0,
        ),
        //done
      }
    ],
    //done////////////
  ];
  static List<List<Map<String, CardChoiceDetails>>> lbCards = [
    // LP1.1
    [
      // LP1.1#1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.20,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 120,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 40,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP1.1#2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.0,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 120,
          egressTime: 0.20,
          transferTime: true,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 25,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 30,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP1.1#3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.0,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 120,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP1.1#4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.10,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 120,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP1.1#5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.10,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 60,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 10,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP1.1#6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: -0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 60,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 10,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 40,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
    ], //done
    // LP1.2
    [
      // LP1.2#7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.10,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 60,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP1.2#8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.0,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 120,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP1.2#9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.0,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 90,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP1.2#10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.20,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 10,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 40,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP1.2#11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: -0.10,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 90,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP1.2#12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: -0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 60,
          egressTime: -0.20,
          transferTime: true,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
    ], //done
    // LP2.1
    [
      // LP2.1#1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.10,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 40,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP2.1#2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: -0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 90,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP2.1#3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 60,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 40,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP2.1#4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.10,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 60,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 40,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP2.1#5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.10,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 60,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP2.1#6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.0,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 60,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 10,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
    ], //done
    // LP2.2
    [
      // LP2.2#7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.10,
          totalCost: 0.00,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 120,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP2.2#8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 120,
          egressTime: 0.20,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 10,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: 0.20,
          transferTime: true,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP2.2#9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.0,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 60,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 25,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 15,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 40,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP2.2#10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.0,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 120,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 25,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP2.2#11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.20,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 60,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP2.2#12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.10,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 120,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 25,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
    ], //done
    // LP3.1
    [
      // LP3.1#1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.0,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 10,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP3.1#2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.20,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 60,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 10,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP3.1#3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.20,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 25,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.0,
        ),
      },
      //done
      //////////
      // LP3.1#4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: -0.10,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 60,
          egressTime: 0.20,
          transferTime: true,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 25,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP3.1#5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: -0.10,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 90,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 10,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP3.1#6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.0,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: true,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 10,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
    ], //done
    // LP3.2
    [
      // LP3.2#7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.20,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 120,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 10,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: true,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP3.2#8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: 0.20,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 90,
          egressTime: 0.20,
          transferTime: true,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 10,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 40,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP3.2#9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: -0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 90,
          egressTime: 0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 10,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP3.2#10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: -0.10,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 60,
          egressTime: 0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 25,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.2,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.2,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP3.2#11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: -0.10,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 120,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 10,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP3.2#12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.0,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 120,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 40,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
    ], //done
    // LP4.1
    [
      // LP4.1#1
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: -0.10,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 60,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP4.1#2
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: -0.10,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: true,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 10,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 20,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP4.1#3
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.0,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 120,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 25,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 40,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP4.1#4
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.20,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 90,
          egressTime: 0.20,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
      },
      //done
      //////////
      // LP4.1#5
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.0,
          egressTime: 0.20,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 60,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 25,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 30,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 30,
          egressTime: 0.0,
          transferTime: true,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP4.1#6
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.20,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 90,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 40,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
    ], //done
    // LP4.2
    [
      // LP4.2#7
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.0,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 120,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 10,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 40,
          egressTime: -0.10,
          transferTime: false,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP4.2#8
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.20,
          egressTime: 0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 90,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 10,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 40,
          egressTime: -0.20,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP4.2#9
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.20,
          totalCost: -0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 120,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 20,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
      // LP4.2#10
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.20,
          totalCost: 0.10,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 90,
          egressTime: 0.10,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 15,
          egressTime: -0.20,
          transferTime: false,
          totalCost: 0.0,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.0,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.10,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
      },
      //done
      //////////
      // LP4.2#11
      {
        "Car": CardChoiceDetails(
          inVehicleTime: -0.10,
          egressTime: -0.10,
          totalCost: 0.0,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 120,
          egressTime: -0.20,
          transferTime: true,
          totalCost: -0.10,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 15,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: true,
          totalCost: 0.0,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 30,
          egressTime: -0.10,
          transferTime: true,
          totalCost: 0.10,
        ),
      },
      //done
      //////////
      // LP4.2#12
      {
        "Car": CardChoiceDetails(
          inVehicleTime: 0.10,
          egressTime: 0.10,
          totalCost: 0.20,
        ),
        "Air": CardChoiceDetails(
          inVehicleTime: 0.20,
          waitingTime: 60,
          egressTime: -0.10,
          transferTime: false,
          totalCost: -0.20,
        ),
        "Bus": CardChoiceDetails(
          inVehicleTime: -0.10,
          waitingTime: 25,
          egressTime: 0.0,
          transferTime: false,
          totalCost: 0.10,
        ),
        "Train": CardChoiceDetails(
          inVehicleTime: 0.10,
          waitingTime: 20,
          egressTime: 0.0,
          transferTime: false,
          totalCost: -0.20,
        ),
        "HS": CardChoiceDetails(
          inVehicleTime: -0.20,
          waitingTime: 30,
          egressTime: 0.10,
          transferTime: false,
          totalCost: 0.0,
        ),
      },
      //done
      //////////
    ], //done
  ];
}

class CardChoiceDetails {
  final double inVehicleTime;
  final int? waitingTime;
  final double egressTime;
  final bool? transferTime;
  final double totalCost;

  CardChoiceDetails({
    required this.inVehicleTime,
    this.waitingTime,
    required this.egressTime,
    this.transferTime,
    required this.totalCost,
  });
}
