module ApplicationHelper

  def recreation_list
    [
      [' '],
      ['Ski'],
      ['Board'],
      ['Both'],
      ['Other']
    ]
  end

  def rtd_location_list
    x = RtdLocation.all.map do |rtd|
      rtd.name
    end
    y = x.unshift(' ')
    y.each_slice(1).to_a
  end

  def vehicle_list
    if current_user.has_vehicles?
      current_user.vehicles.map do |vehicle|
        "#{vehicle.make} #{vehicle.model}"
      end.unshift(' ').each_slice(1).to_a
    end
  end

  def trip_list
    [
      [' '],
      ['One Way'],
      ['Round Trip']
    ]
  end

  def pass_list
    [
      [' '],
      ['IKON'],
      ['Epic'],
      ['Other'],
      ['No Preference'],
      ['No Pass']
    ]
  end

  def days_list
    [
      [' '],
      ['Monday'],
      ['Tuesday'],
      ['Wednesday'],
      ['Thursday'],
      ['Friday'],
      ['Saturday'],
      ['Sunday'],
      ['Weekend Sat-Sun'],
      ['Any Day']
    ]
  end

  def dates_list
    [
      [' '],
      ['01'],
      ['02'],
      ['03'],
      ['04'],
      ['05'],
      ['06'],
      ['07'],
      ['08'],
      ['09'],
      ['10'],
      ['11'],
      ['12'],
      ['13'],
      ['14'],
      ['15'],
      ['16'],
      ['17'],
      ['18'],
      ['19'],
      ['20'],
      ['21'],
      ['22'],
      ['23'],
      ['24'],
      ['25'],
      ['26'],
      ['27'],
      ['28'],
      ['29'],
      ['30'],
      ['31']
    ]
  end

  def month_list
    [
      [' '],
      ['Jan'],
      ['Feb'],
      ['Mar'],
      ['Apr'],
      ['May'],
      ['Jun'],
      ['Jul'],
      ['Aug'],
      ['Sep'],
      ['Oct'],
      ['Nov'],
      ['Dec']
    ]
  end

  def year_list
    [
      [' '],
      ['2019'],
      ['2020']
    ]
  end

  def seats_list
    [
      [' '],
      ['1'],
      ['2'],
      ['3'],
      ['4'],
      ['5']
    ]
  end

  def destination_list
    [
      [' '],
      ['Keystone']
    ]
  end

end
